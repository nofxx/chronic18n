require "chronic"
require "yaml"

require "chronic18n/translator"

module Chronic18n

  def self.parse(txt, lang = nil)
    Chronic.parse(lang ? Translator.new(txt, lang).work : txt)
  end

end

