# This plugin library provides a VariableGenerator plugin for Jekyll, which can
# produce additional pages in the site's rendered output. See the documentation
# on the class below for more details.

require 'nokogiri'

module BlueButtonApi
  # Each Variable instance represents a second-level `<variable/>` element
  # parsed from one the codebook PDFs.
  #
  # This class just acts as a convenience utility to prevent VariablePage from
  # having to handle Nokogiri/XML directly.
  #
  # There is not currently an XML schema published for these files, but the
  # structure is constrained by the JAXB model classes used to generate them.
  # See `bluebutton-data-model.git/bluebutton-data-model-codebook-extractor` for
  # details.
  class Variable
    attr_reader :id

    def initialize(variable_xml)
      @data = parse_variable_xml(variable_xml)

      # Pull out an `id` attribute that uniquely identifies this variable within
      # its codebook.
      @id = @data['id']
    end

    # Takes the attributes of @data and merges them into another hash.
    def export_data(target)
      @data.each do |key,value|
        target[key] = value
      end
    end

    def parse_variable_xml(variable_xml)
      data = {}

      # We force lowercase here to get prettier URLs.
      data['id'] = variable_xml['id'].downcase

      data['label'] = variable_xml['label']
      data['description'] = parse_paragraphs(variable_xml.xpath('.//description').first)
      data['short_name'] = variable_xml['shortName']
      data['long_name'] = variable_xml['longName']
      data['type'] = variable_xml['type']
      data['length'] = variable_xml['length']
      data['source'] = variable_xml['source']
      data['value_format'] = variable_xml['valueFormat']
      data['value_groups'] = parse_value_groups(variable_xml.xpath('.//valueGroups').first)
      data['comment'] = parse_paragraphs(variable_xml.xpath('.//comment').first)

      return data
    end

    def convert_smart_quotes(text)
      smart_quotes_map = {
        "\u2018" => "'", # Left single quote
        "\uFFFD" => "'",
        "\u2019" => "'", # Right single quote
        "\u201C" => '"', # Left double quote
        "\u201D" => '"', # Right double quote
      }.freeze
      text.tr(smart_quotes_map.keys.join, smart_quotes_map.values.join)
    end
    def parse_paragraphs(paragraphs_xml)

      paragraphs = []
      return paragraphs if paragraphs_xml.nil?

      paragraphs_xml.xpath('.//p').each do |paragraph|
        paragraphs.push(convert_smart_quotes(paragraph.content))
      end
      return paragraphs
    end

    def parse_value_groups(value_groups_xml)
      value_groups = []
      return value_groups if value_groups_xml.nil?

      # Each <valueGroups/> can have multiple <valueGroup/> entries.
      value_groups_xml.xpath('.//valueGroup').each do |value_group_xml|
        value_group = {}
	
        # Each <valueGroup/> can have a single <description/>.
        value_group['description'] = parse_paragraphs(value_group_xml.xpath('.//description').first)

        # Each <valueGroup/> can have multiple <value/> entries.
        value_group['values'] = []
        value_group_xml.xpath('.//value').each do |value_xml|
          value = {}

          value['code'] = value_xml['code']
          value['description'] = value_xml.content

          value_group['values'].push(value)
        end

        value_groups.push(value_group)
      end

      return value_groups
    end
  end
end

module Jekyll
  # Each VariablePage instance represents a Jekyll page that can be rendered,
  # providing documentation for the BlueButtonApi::Variable that it represents.
  class VariablePage < Page
    def initialize(site, variable)
      @site = site
      @base = site.source
      @dir = File.join('resources', 'variables', variable.id)
      @name = 'index.html'

      self.process(@name)

      # Despite the name, the most important thing that this method does is to
      # set the specified file as the layout to use for this page.
      self.read_yaml(File.join(@base, '_layouts'), site.config['codebooks']['layout'])

      # Values in the page's `data` hash can be used by the layout for
      # rendering.
      variable.export_data(self.data)
    end
  end

  # VariableGenerator is a Jekyll Generator plugin, which can produce pages that
  # will be included in the site's rendered output.
  #
  # It relies on config like the following in the site's `_config.yml`:
  #
  # codebooks:
  #   layout: codeset.html
  #   xml_files:
  #     - _codebooks/some-codebook-file.xml
  #
  # In the above config, the `layout` is the name of the file in the site's
  # `_layouts` directory, which will be used to render each `VariablePage`
  # instance produced by this Generator. The `xml_files` are the XML files that
  # pages will be generated from/for.
  class VariableGenerator < Generator
    safe true

    def generate(site)
      # Verify that the required configuration for this plugin is present.
      Jekyll.logger.debug('VariableGenerator:', 'Verifying configuration...')
      return unless site.config.key? 'codebooks'
      return unless site.config['codebooks'].key? 'layout'
      return unless site.config['codebooks'].key? 'xml_files'
      Jekyll.logger.debug('VariableGenerator:', 'Configured.')

      # Parse each XML file and generate a `VariablePage` for each `<variable/>`
      # entry.
      site.config['codebooks']['xml_files'].each do |xml_file|
        Jekyll.logger.info('VariableGenerator:', "Processing codebook XML file '#{xml_file}'...")
        codebook_doc = Nokogiri::XML(File.open(xml_file))
        codebook_doc.xpath('/codebook//variable').each do |variable_xml|
          variable = BlueButtonApi::Variable.new(variable_xml)
          Jekyll.logger.debug('VariableGenerator:', "Found variable: '#{variable.id}'")
	  site.pages << VariablePage.new(site, variable)
        end
        Jekyll.logger.info('VariableGenerator:', "Processed codebook XML file '#{xml_file}'.")
      end
    end
  end
end
