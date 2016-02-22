require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Chronic18n" do

  it "exists" do
    Chronic18n.should be_a Module
  end

  it "should return nil if it doesn't parse x" do
    Chronic18n.parse("cras nox noctis", lang: :la).should be_nil
  end

  it 'can parse text with html tags' do
    Chronic18n.parse("<strong>Feb 20, 1984</strong>").should_not be_nil
  end

  it 'can parse certain free-form texts with dates' do
    date = Chronic18n.parse("Application date on 20/02/1984")
    date.to_date.should eq(Date.new(1984, 02, 20))
  end

  it 'can recognize some common date patterns' do
    date = Chronic18n.parse("Tue, 19 Jan 2016 15:01:26 Europe/Amsterdam")
    date.to_date.should eq(Date.new(2016, 01, 19))
  end
end
