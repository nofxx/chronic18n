require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Spanish" do
  it "should parse something" do
    Chronic18n.parse("lunes", lang: :es).should be_a Time
  end

  it "should parse hour" do
    Chronic18n.parse("en 7 horas", lang: :es).hour.should eql((Time.now.hour + 7) % 24)
  end

  it "should parse hour" do
    Chronic18n.parse("en 7 minutos", lang: :es).min.should eql((Time.now.min + 7) % 60)
  end

  it "should parse sunday" do
    Chronic18n.parse("domingo", lang: :es).wday.should eql(0)
  end

  it "should parse monday" do
    Chronic18n.parse("martes", lang: :es).wday.should eql(2)
  end

  it "should parse month" do
    Chronic18n.parse("mayo 3", lang: :es).month.should eql(5)
  end

  it "should parse monday" do
    Chronic18n.parse("mar", lang: :es).month.should eql(3)
  end

  it "should parse month" do
    Chronic18n.parse("may 3", lang: :es).month.should eql(5)
  end

  it "should parse next month" do
    Chronic18n.parse("mes que viene", country: 'AR').month.should eql(Time.now.month % 12 + 1)
  end

  it "should parse today" do
    Chronic18n.parse("hoy a las 6pm", country: 'MX').day.should eql((Time.now.day))
  end
end
