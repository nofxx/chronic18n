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
    parser = cc.parser_for(lang)

    txt = Translator.new(txt, lang).work
    date = parser.parse(txt, options)
    return date if date

    # try again, but with some heuristics
    date = use_patterns(txt)
    if date
      parsed = parser.parse(date, options)
      return parsed if parsed
    end

    date = use_separator(txt)
    if date
      parsed = parser.parse(date, options)
      return parsed if parsed
    end
  end

  SEPARATORS = /\bon\b|\buntil\b|\bby\b|:\s+/i
  SANITIZER_REGEXP = Regexp.new("(<[^>]*>)|,\\s+")
  COMMON_PATTERNS = [
    /\b(?'day'\d{1,2})\s+(?'month'[a-zA-Z\.]+),*\s+(?'year'\d{4})/,
    /\b(?'month'[\p{L}\.]+)[-_,\s]+(?'day'\d{1,2})[-_,\s]+(?'year'\d{4})/,
    /\b(?'year'\d{4})[-.\/\s]?(?'month'\d{1,2})[-.\/\s]?(?'day'\d{1,2})/,
    /\b(?'day'\d{1,2})[-_,\s]+(?'month'\p{L}*)[-_,\s]*(?'year'\d{4})?/
  ]

  def self.sanitize(text)
    text.gsub(SANITIZER_REGEXP, ' ')
  end

  def self.use_separator(txt)
    if parts = txt.split(SEPARATORS)
      if parts.size > 1
        parts.last
      end
    end
  end

  def self.use_patterns(txt)
    COMMON_PATTERNS.each do |pattern|
      if md = pattern.match(txt)
        if md['month'].length > 2
          return "#{md['day']} #{md['month']} #{md['year']}"
        else
          return "#{md['day']}/#{md['month']}/#{md['year']}"
        end
      end
    end
    nil
  end
end
