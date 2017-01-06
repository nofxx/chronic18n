require 'countries'
require 'cld'

module Chronic18n
  class CountryConfig
    CONFIG = YAML.load_file(File.join(File.dirname(__FILE__), 'country_config.yml'))
    DEFAULT_CONFIG = CONFIG['default']
    LANGUAGE_CONFIG = CONFIG['languages']

    def initialize(country)
      if country
        @config = CONFIG[country]
        @country = ISO3166::Country[country]
      end
    end

    def parser_options
      read_config 'parser_options'
    end

    def parser_for(lang)
      Chronic18n.const_get(LANGUAGE_CONFIG[lang.to_s] || read_config('parser'))
    end

    def detect_language_for(text)
      if @country
        tokens = text.split(/\s/)
        @country.languages.each do |lang|
          lang = lang.split('-').first
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
