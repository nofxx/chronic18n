module Chronic18n

  class Translator

    DICS = File.join(File.dirname(__FILE__), "dics", "")

    def initialize(txt, lang)
      @txt = txt
      load_dic(lang.to_s)
    end

    def load_dic(lang)
      @regex = YAML.load(File.read(DICS + "#{lang}_regex.yml"))[lang]
      @dic = YAML.load(File.read(DICS + "#{lang}.yml"))[lang]
    end

    def work
      @regex.each { |k, v| @txt.gsub!(k, v)} if @regex
      @txt.split(/\s/).map { |w| @dic[w] || w }.join(" ")
    end

  end

end
