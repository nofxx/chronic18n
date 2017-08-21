require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Thai" do
  it "should parse something with lang supplied" do
    Chronic18n.parse("21 เมษายน 2015", lang: :th).should eq(Time.parse("2015-04-21 12:00:00"))
  end

  it "should parse something with country supplied" do
    Chronic18n.parse("21 เมษายน 2015", country: 'TH').should eq(Time.parse("2015-04-21 12:00:00"))
  end

  it "should parse dates from the buddhist date calendar" do
    date = Chronic18n.parse("21 เมษายน 2558", country: :th).to_date
    date.should == Date.new(2015, 4, 21)    
  end

  it "should parse abbreviated dates" do
    date = Chronic18n.parse("21 ก.ย. 2558", country: :th).to_date
    date.should == Date.new(2015, 9, 21)
  end

  it "should parse dates included in long texts" do
    date = Chronic18n.parse("วันที่โพสต์ 4 มี.ค. 2559", country: :th).to_date
    date.should == Date.new(2016, 3, 4)
  end

  it "should parse x days ago" do
    date = Chronic18n.parse("3 วันที่แล้ว", country: :th)
    days_ago = Date.today - 3
    date.to_date.should == days_ago.to_date
  end

  it "should parse x days ago in another syntax" do
    date = Chronic18n.parse("3 วันก่อน", country: :th)
    days_ago = Date.today - 3
    date.to_date.should == days_ago.to_date
  end

  it "should parse x days ago in yet another syntax" do
    date = Chronic18n.parse("3 วันที่ผ่านมา", country: :th)
    days_ago = Date.today - 3
    date.to_date.should == days_ago.to_date
  end

  it 'should parse buddhist short dates' do
    date = Chronic18n.parse("15 ก.ย. 54", country: :th).to_date
    date.should == Date.new(2011, 9, 15)
  end

  it 'should parse buddhist year even if we only provide language' do
    date = Chronic18n.parse("2560-01-01", lang: 'th')
    date.day.should == 1
    date.month.should == 1
    date.year.should == 2017
  end

  it 'should parse today' do
    Chronic18n.parse('วันนี้').to_date.should == Date.today
  end

  it 'should parse number in thai' do
    date = Chronic18n.parse("๑๕ ก.ย. ๕๔", country: :th).to_date
    date.should == Date.new(2011, 9, 15)
  end
end
