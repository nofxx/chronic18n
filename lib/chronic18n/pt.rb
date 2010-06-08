module Chronic18n

  module Pt
    DIC = Chronic18n.load_dic(:pt)


    def self.translate(txt)
      txt.split(/\s/).map { |w| DIC[w] || w }.join(" ")
    end
  end

end
