require "chronic"
require "yaml"

require "chronic18n/country_config"
require "chronic18n/translator"

Dir[File.join(File.dirname(__FILE__), 'chronic18n', 'parsers', '*.rb')].each do |file|
  require "chronic18n/parsers/#{File.basename(file, ".rb")}"
end

module Chronic18n
  # Try to get a Time object out of a chunk of text.
  #
  #  Chronic18n.parse("hoje", country: 'BR')
  #  Chronic18n.parse("oggi", lang: "it")
  #
  # Tries to autodetect the language if locale is not supplied
  #
  #  Chronic18n.parse("today")
  #
  def self.parse(txt, options = {})
    return nil if txt.nil?

    country = options.delete :country
    lang = options.delete(:lang)

    cc = CountryConfig.new(country)
    options = cc.parser_options.merge(options)
    lang = cc.detect_language_for(txt) if lang.nil?
    parser = cc.parser

    txt = Translator.new(txt, lang).work
    return parser.parse(txt, options)
  end
end

