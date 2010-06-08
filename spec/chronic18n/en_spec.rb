require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "English" do

  it "should fallback to en fine" do
    Chronic18n.parse("sunday").wday.should eql(0)
  end


end
