require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Chronic18n" do

  it "should exists" do
    Chronic18n.should be_a Module
  end

  it "should raise error if it doesn't parle x" do
    expect { Chronic18n.parse("cras nox noctis", :la) }.to raise_error(Chronic18n::UnknownLanguage)
  end
end
