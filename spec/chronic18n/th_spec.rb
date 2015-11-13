require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Thai" do
  it "should parse something with lang supplied" do
    Chronic18n.parse("21 เมษายน 2015", lang: :th).should eq(Time.parse("2015-04-21 12:00:00"))
  end

  it "should parse something with country supplied" do
    Chronic18n.parse("21 เมษายน 2015", country: 'TH').should eq(Time.parse("2015-04-21 12:00:00"))
  end

  it "should parse dates from the buddhist date calendar" do
    date = Chronic18n.parse("21 เมษายน 2558", country: :th)
    date.day.should == 21
    date.month.should == 4
    date.year.should == 2015
  end
end
