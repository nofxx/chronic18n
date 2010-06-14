module Chronic18n


  class Translator

    def initialize(txt, lang)
      @txt = txt
      @dic = load_dic(lang)
    end

    def load_dic(lang)
      YAML.load(File.read(File.join(File.dirname(__FILE__), "dics", "#{lang}.yml")))[lang]
    end

    def work
      @txt.split(/\s/).map { |w| @dic[w] || w }.join(" ")
    end
  end

end
