# This file provides a VariableGenerator plugin for Jekyll, which can
# produce additional pages in the site's rendered output. See the documentation
# on the class below for more details.

module RdaApi
  # Each Variable instance represents a field derived from the RDA API data
  # dictionary CSV extract file located in the _data directory.
  #
  # Data elements are extracted from the CSV file using the column headers to
  # identify each field.  Only the fields required to render a page are extracted
  # from the CSV records.
  class Variable
    
    attr_reader :id, :source_system

    def initialize(csv_row)
      # Extract just the fields we need to display.
      @data = parse_csv_row(csv_row)

      # Pull out the `id` attribute that uniquely identifies this variable.
      @id = @data['id']

      # Pull out the source system (FISS or MCS) from which this variable originates.
      @source_system = @data['source_system'].downcase
    end

    # Takes the attributes of @data and merges them into another hash.
    def export_data(target)
      target.merge!(@data)
    end

    # Extract the columns we need into a new Hash.
    def parse_csv_row(csv_row)
      data = Hash.new('')

      data['source_system'] = csv_row['Source system'].to_s
      data['field'] = csv_row['Field name'].to_s
      data['source_field'] = csv_row['Source copybook field label'].to_s
      data['alt_source_field'] = csv_row['Copybook data dictionary name (if different)'].to_s
      data['source_definition'] = split(csv_row['Source system definition'].to_s)
      data['version'] = csv_row['Version added'].to_s

      # We prefer the copybook data dictionary name if there is one.
      if data['alt_source_field'] =~ %r{^[A-Z]+(-[A-Z]+)*$}
        data['field_label'] = data['alt_source_field']
      else
        data['field_label'] = data['source_field']
      end

      # We force lowercase here to get prettier URLs.
      data['id'] = data['field_label'].downcase

      return data
    end

    def split(text)
      if text.nil? || text.empty?
        []
      else
        text.split("\n").reject {|s| s.empty?}
      end
    end

    def is_valid()
      return @data['id'] != '' && @data['source_system'] != '' && @data['source_field'] != ''
    end
  end
end

module Jekyll
  # Each VariablePage instance represents a Jekyll page that can be rendered,
  # providing documentation for the BlueButtonApi::Variable that it represents.
  class RdaVariablePage < Page
    def initialize(site, layout, variable)
      @site = site
      @base = site.source
      @dir = File.join('resources', 'variables', variable.source_system, variable.id)
      @name = 'index.html'

      self.process(@name)

      # Despite the name, the most important thing that this method does is to
      # set the specified file as the layout to use for this page.
      self.read_yaml(File.join(@base, '_layouts'), layout)

      # Values in the page's `data` hash can be used by the layout for rendering.
      variable.export_data(self.data)
    end
  end

  # VariableGenerator is a Jekyll Generator plugin, which can produce pages that
  # will be included in the site's rendered output.
  class RdaVariableGenerator < Generator
    safe true

    def generate(site)
      Jekyll.logger.debug('RdaVariableGenerator:', 'Verifying configuration...')
      return unless site.config.key? 'rda_api'
      config = site.config['rda_api']
      
      return unless config.key? 'layout'
      layout = config['layout']

      csv_file_key = config['csv_file_key']
      return unless config.key? 'csv_file_key'
      Jekyll.logger.debug('RdaVariableGenerator:', 'Configured.')

      # Parse each XML file and generate a `VariablePage` for each `<variable/>`
      # entry.
      site.data[csv_file_key].each do |csv_row|
        variable_obj = RdaApi::Variable.new(csv_row)
        if variable_obj.is_valid
	        site.pages << RdaVariablePage.new(site, layout, variable_obj)
        end
      end
    end
  end
end
