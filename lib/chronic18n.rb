require 'chronic'
require 'yaml'

require "chronic18n/translator"

module Chronic18n

  #
  # Try to get a Time object out of a chunk of text.
  #
  #  Chronic18n.parse("hoje", "pt")
  #  Chronic18n.parse("oggi", "it")
  #
  # Falls back to Chronic with "en" or w/o params:
  #
  #  Chronic18n.parse("today")
  #
  def self.parse(txt, lang = "en")
    Chronic.parse(lang.to_s != "en" ? Translator.new(txt, lang).work : txt)
  end

end

