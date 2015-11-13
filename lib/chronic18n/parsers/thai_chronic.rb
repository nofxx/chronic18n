module Chronic18n
  class ThaiChronic
    def self.parse(txt, options = {})
      date = Chronic.parse(txt, options)
      if date
        if date.year - Time.now.year > 500
          date = Date.new(date.year - 543, date.month, date.day)
        end
      end
      date
    end
  end
end
