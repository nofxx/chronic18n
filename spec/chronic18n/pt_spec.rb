require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Portuguese" do

  it "should parse something" do
    Chronic18n.parse("domingo", :pt).should be_a Time
  end

  it "should parse hour" do
    Chronic18n.parse("daqui 7 horas", :pt).hour.should eql(Time.now.hour + 7)
  end

  it "should parse hour" do
    Chronic18n.parse("em 7 minutos", :pt).min.should eql(Time.now.min + 7)
  end

  it "should parse sunday" do
    Chronic18n.parse("domingo", :pt).wday.should eql(0)
  end

  it "should parse monday" do
    Chronic18n.parse("segunda", :pt).wday.should eql(1)
    Chronic18n.parse("segunda-feira", :pt).wday.should eql(1)
  end

  it "should parse month" do
    Chronic18n.parse("maio 3", :pt).month.should eql(5)
  end

  it "should parse month" do
    Chronic18n.parse("daqui 3 dias", :pt).day.should eql(Time.now.day + 3)
  end

  it "should parse month" do
    Chronic18n.parse("daqui 3 semanas", :pt).day.should eql(Time.now.day + 3)
  end

end
