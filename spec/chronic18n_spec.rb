require 'spec_helper'

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

  it 'can recognize some special date patterns' do
    date = Chronic18n.parse('00:00:00 25/12/2018')
    date.to_date.should eq(Date.new(2018, 12, 25))

    date = Chronic18n.parse('Sat, 17 03 18 11:47:01 +0000')
    date.to_date.should eq(Date.new(2018, 03, 17))
  end

  context 'patterns' do
    {
      '2006-01-03' => Date.new(2006, 01, 03),
      '2006/01/03' => Date.new(2006, 01, 03),
      '2006/1/3' => Date.new(2006, 01, 03),
      '2006.01.03' => Date.new(2006, 01, 03),
      '10 December 2016' => Date.new(2016, 12, 10),
      'Dec 11 2017' => Date.new(2017, 12, 11),
      'Dec-11-2017' => Date.new(2017, 12, 11),
      '1 March 2011' => Date.new(2011, 3, 1),
      '2006 01 03' => Date.new(2006, 01, 03),
    }.each do |source, expectation|
      it "parses #{source} format" do
        Chronic18n.parse(source).to_date.should == expectation
      end
    end
  end
end
