require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Vietnamese" do
  it "should parse something" do
    expect(Chronic18n.parse("31 tháng 7 2004", :vi)).to eq(Time.parse("2004-07-31 12:00:00"))
  end
end
