# This plugin library provides a CodingGenerator plugin for Jekyll, which can
# produce additional pages in the site's rendered output. See the documentation
# on the class below for more details.

require 'nokogiri'

module BlueButtonApi
  # Each Codeset instance represents a second-level `<code/>` element parsed
  # from one the codebook PDFs.
  #
  # This class just acts as a convenience utility to prevent CodingPage from
  # having to handle Nokogiri/XML directly.
  class Codeset
    attr_reader :id

    def initialize(codeset_xml)
      @codeset_xml = codeset_xml

      # Pull out an `id` attribute that uniquely identifies this codeset within
      # its codebook.
      data_tmp = {}
      generate_data(data_tmp)
      @id = data_tmp['id']
    end

    def generate_data(data)
      # Can't use just `name` here, as Jekyll replaces that field.
      data['id'] = @codeset_xml.xpath('.//name')[0].content.downcase

      data['label'] = @codeset_xml.xpath('.//label')[0].content
      data['description'] = parse_paragraphs(@codeset_xml.xpath('.//description')[0])
      data['short_name'] = @codeset_xml.xpath('.//shortName')[0].content
      data['long_name'] = @codeset_xml.xpath('.//longName')[0].content
      data['type'] = @codeset_xml.xpath('.//type')[0].content
      data['length'] = @codeset_xml.xpath('.//length')[0].content
      data['source'] = @codeset_xml.xpath('.//source')[0].content
      data['value_format'] = @codeset_xml.xpath('.//valueFormat')[0].content
      data['value_groups'] = parse_value_groups(@codeset_xml.xpath('.//values')[0])
      data['comment'] = parse_paragraphs(@codeset_xml.xpath('.//comment')[0])
    end

    def parse_paragraphs(paragraphs_xml)
      paragraphs = []
      paragraphs_xml.xpath('.//p').each do |paragraph|
        paragraphs.push(paragraph.content)
      end
      return paragraphs
    end

    def parse_value_groups(value_groups_xml)
      value_groups = []

      # Each <values/> can have multiple <valuegroups/>.
      value_groups_xml.xpath('.//valuegroup').each do |value_group_xml|
        value_group = {}
	
        # Each <valuegroup/> can have a single <description/>.
        value_group['description'] = value_group_xml.content.strip

        # Each <valuegroup/> can have multiple <values/>.
	value_group['values'] = []
        value_group_xml.xpath('.//value').each do |value_xml|
          value = {}

          value['value'] = value_xml['value'].strip
          value['description'] = value_xml['description'].strip

          value_group['values'].push(value)
        end

        value_groups.push(value_group)
      end

      return value_groups
    end
  end
end

module Jekyll
  # Each CodingPage instance represents a Jekyll page that can be rendered,
  # providing documentation for the BlueButtonApi::Codeset that it represents.
  class CodingPage < Page
    def initialize(site, codeset)
      @site = site
      @base = site.source
      @dir = File.join('resources', codeset.id)
      @name = 'index.html'

      self.process(@name)

      # Despite the name, the most important thing that this method does is to
      # set the specified file as the layout to use for this page.
      self.read_yaml(File.join(@base, '_layouts'), site.config['codebooks']['layout'])

      # Values in the page's `data` hash can be used by the layout for
      # rendering.
      codeset.generate_data(self.data)
    end
  end

  # CodingGenerator is a Jekyll Generator plugin, which can produce pages that
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
  # `_layouts` directory, which will be used to render each `CodingPage`
  # instance produced by this Generator. The `xml_files` are the XML files that
  # pages will be generated from/for.
  class CodingGenerator < Generator
    safe true

    def generate(site)
      # Verify that the required configuration for this plugin is present.
      Jekyll.logger.debug('CodingGenerator:', 'Verifying configuration...')
      return unless site.config.key? 'codebooks'
      return unless site.config['codebooks'].key? 'layout'
      return unless site.config['codebooks'].key? 'xml_files'
      Jekyll.logger.debug('CodingGenerator:', 'Configured.')

      # Parse each XML file and generate a `CodingPage` for each `<code/>`
      # entry.
      site.config['codebooks']['xml_files'].each do |xml_file|
        Jekyll.logger.info('CodingGenerator:', "Processing codebook XML file '#{xml_file}'...")
        codebook_doc = Nokogiri::XML(File.open(xml_file))
        Jekyll.logger.debug('CodingGenerator:', codebook_doc)
        codebook_doc.xpath('/codes//code').each do |codeset_xml|
          codeset = BlueButtonApi::Codeset.new(codeset_xml)
          Jekyll.logger.debug('CodingGenerator:', "Found codeset: '#{codeset.id}'")
	  site.pages << CodingPage.new(site, codeset)
        end
        Jekyll.logger.info('CodingGenerator:', "Processed codebook XML file '#{xml_file}'.")
      end
    end
  end
end
