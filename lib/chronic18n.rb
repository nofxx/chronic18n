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
    txt = sanitize txt.downcase

    country = options.delete(:country)
    lang = options.delete(:lang)

    lang = lang.to_s if lang
    country = country.to_s.upcase if country

    cc = CountryConfig.new(country)
    options = cc.parser_options.merge(options)
    lang = cc.detect_language_for(txt) if lang.nil?
    parser = cc.parser

    txt = Translator.new(txt, lang).work
    date = parser.parse(txt, options)
    return date if date

    # try again, but with some heuristics
    if parts = txt.split(SEPARATORS)
      if parts.size > 1
        return parser.parse(parts.last, options)
      end
    end
  end

  SEPARATORS = /\bon\b|\buntil\b|\bby\b|[a-zA-Z\s]+:/i
  SANITIZER_REGEXP = Regexp.new("<[^>]*>")

  def self.sanitize(text)
    text.gsub(SANITIZER_REGEXP, '')
  end
end

