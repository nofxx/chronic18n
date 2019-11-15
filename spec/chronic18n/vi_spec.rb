require 'spec_helper'

describe "Vietnamese" do
  it "should parse when given the vietnamese locale" do
    Chronic18n.parse("3 tháng 1 năm 2015", lang: :vi).should eq(Time.parse("2015-01-03 12:00:00"))
  end

  it "should parse when given the VN country" do
    Chronic18n.parse("3 tháng 1 năm 2015", country: 'VN').should eq(Time.parse("2015-01-03 12:00:00"))
  end

  it "should parse when language autodetection" do
    Chronic18n.parse("3 tháng 1 năm 2015").should eq(Time.parse("2015-01-03 12:00:00"))
  end

end
