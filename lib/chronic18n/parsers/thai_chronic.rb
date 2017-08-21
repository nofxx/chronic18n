module Chronic18n
  class ThaiChronic
    def self.parse(txt, options = {})
      date = Chronic.parse(txt, options) # 2017 / 17 / 2560 / 60 is the same year
      if date
        current_year = Time.now.year # 2560 -> 2017
        # incase it's short year
        if (date.year - current_year).between?(30, 60) # 60
          date = Date.new(date.year + 500, date.month, date.day)
        end

        if date.year - current_year > 500 # 2560
          date = Date.new(date.year - 543, date.month, date.day)
        end
      end
      date
    end
  end
end
