require "chronic"
require "yaml"


module Chronic18n

  def self.parse(txt, lang = nil)
    Chronic.parse(lang ? const_get(lang.capitalize).translate(txt) : txt)
  end

  def self.load_dic(lang)
    YAML.load(File.read(File.join(File.dirname(__FILE__), "chronic18n", "dics", "#{lang}.yml")))[lang]
  end

end

require "chronic18n/pt"
