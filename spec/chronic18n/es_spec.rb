require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Spanish" do

  it "should parse something" do
    Chronic18n.parse("lunes", :es).should be_a Time
  end

  it "should parse hour" do
    Chronic18n.parse("en 7 horas", :es).hour.should eql((Time.now.hour + 7) % 24)
  end

  it "should parse hour" do
    Chronic18n.parse("en 7 minutos", :es).min.should eql((Time.now.min + 7) % 60)
  end

  it "should parse sunday" do
    Chronic18n.parse("domingo", :es).wday.should eql(0)
  end

  it "should parse monday" do
    Chronic18n.parse("martes", :es).wday.should eql(2)
  end

  it "should parse month" do
    Chronic18n.parse("mayo 3", :es).month.should eql(5)
  end


end
