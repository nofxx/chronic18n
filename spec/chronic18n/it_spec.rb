require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Italian" do

  it "should parse something" do
    Chronic18n.parse("sabato", lang: :it).should be_a Time
  end

  it "should parse hour" do
    Chronic18n.parse("in 7 oras", lang: :it).hour.should eql((Time.now.hour + 7) % 24)
  end

  it "should parse hour" do
    Chronic18n.parse("in 7 minutos", lang: :it).min.should eql((Time.now.min + 7) % 60)
  end

  it "should parse sunday" do
    Chronic18n.parse("domenica", country: :it).wday.should eql(0)
  end

  it "should parse monday" do
    Chronic18n.parse("mercoledi", lang: :it).wday.should eql(3)
  end

  it "should parse month" do
    Chronic18n.parse("maggio", lang: :it).month.should eql(5)
  end


end
