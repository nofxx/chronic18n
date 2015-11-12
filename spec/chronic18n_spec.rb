require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Chronic18n" do

  it "should exists" do
    Chronic18n.should be_a Module
  end

  it "should return nil if it doesn't parse x" do
    Chronic18n.parse("cras nox noctis", lang: :la).should be_nil
  end
end
