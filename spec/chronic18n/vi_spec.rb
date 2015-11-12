require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Vietnamese" do
  it "should parse when given the vietnamese locale" do
    expect(Chronic18n.parse("3 tháng 1 năm 2015", lang: :vi)).to eq(Time.parse("2015-01-03 12:00:00"))
  end

  it "should parse when given the VN country" do
    expect(Chronic18n.parse("3 tháng 1 năm 2015", country: 'VN')).to eq(Time.parse("2015-01-03 12:00:00"))
  end
end
