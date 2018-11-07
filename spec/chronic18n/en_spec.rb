require 'spec_helper'

describe "English" do
  it "should fallback to en fine" do
    Chronic18n.parse("sunday").wday.should eql(0)
  end

  it "should fallback to en fine" do
    Chronic18n.parse("sunday", lang: "en").wday.should eql(0)
  end

  it "should fallback to en fine" do
    Chronic18n.parse("sunday", country: 'PH').wday.should eql(0)
  end

  it "should parse the correct country for US" do
    date = Chronic18n.parse("04/03/2005", country: 'US')
    date.day.should == 3
    date.month.should == 4
    date.year.should == 2005
  end

  it "should parse the correct country for AU" do
    date = Chronic18n.parse("04/03/2005", country: 'AU')
    date.day.should == 4
    date.month.should == 3
    date.year.should == 2005
  end

  it 'parses date without year and skips time' do
    today = Date.new(2011, 3, 7)
    Timecop.freeze(today)

    date = Chronic18n.parse('16 Dec-19:52', country: 'AU').to_date
    date.should == Date.new(2011, 12, 16)

    Timecop.return
  end
end
