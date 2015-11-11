require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Thai" do
  it "should parse something" do
    expect(Chronic18n.parse("21 เมษายน 2015", :th)).to eq(Time.parse("2015-04-21 12:00:00"))
  end
end
