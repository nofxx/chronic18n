require 'countries'
require 'cld'

module Chronic18n
  class CountryConfig
    CONFIG = YAML.load_file(File.join(File.dirname(__FILE__), 'country_config.yml'))
    DEFAULT_CONFIG = CONFIG['default']

    def initialize(country)
      @config = CONFIG[country.upcase] if country
      @country = ISO3166::Country[country]
    end

    def parser_options
      read_config 'parser_options'
    end

    def parser
      Chronic18n.const_get(read_config('parser'))
    end

    def detect_language_for(text)
      if @country
        tokens = text.split(/\s/)
        @country.languages.each do |lang|
          if dic = Chronic18n::DICS[lang]
            # if there's an intersection of tokens then we've detected the language
            return lang if !(tokens & dic.keys).empty?
          end
        end
      end

      res = CLD.detect_language(text)
      return res[:code] if res
    end

    private

    def read_config(option)
      return DEFAULT_CONFIG[option] unless @config
      return @config[option] || DEFAULT_CONFIG[option]
    end
  end
end
