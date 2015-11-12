module Chronic18n

  DICS = Dir[File.join(File.dirname(__FILE__), 'dics', '*.yml')].reduce({}) do |h,y|
    h.merge YAML.load(File.read(y))
  end

  class Translator
    def initialize(txt, lang)
      @txt, @lang = txt, lang.to_s
    end

    def work
      return @txt unless dic = DICS[@lang]

      # Regex gsub!
      if rxp = DICS["#{@lang}_regex"]
        rxp.each { |k, v| @txt.gsub!(k, v)}
      end

      # Match translate
      @txt.split(/\s/).map { |w| dic[w] || w }.join(" ")
    end
  end
end
