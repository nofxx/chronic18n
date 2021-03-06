require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "French" do

  it "should parse something" do
    Chronic18n.parse("lundi", :fr).should be_a Time
  end

  it "should parse hour" do
    Chronic18n.parse("dans 7 heures", :fr).hour.should eql((Time.now.hour + 7) % 24)
  end

  it "should parse hour" do
    Chronic18n.parse("dans 7 minutes", :fr).min.should eql((Time.now.min + 7) % 60)
  end

  it "should parse sunday" do
    Chronic18n.parse("dimanche", :fr).wday.should eql(0)
  end

  it "should parse monday" do
    Chronic18n.parse("lundi", :fr).wday.should eql(1)
  end

  it "should parse day" do
    Chronic18n.parse("3 mai", :fr).month.should eql(5)
  end

  it "should parse month" do
    Chronic18n.parse("mars", :fr).month.should eql(3)
  end

  it "should parse next month" do
    Chronic18n.parse("le mois prochain", :fr).month.should eql((Time.now.month + 1 % 12))
  end

  it "should parse today" do
    Chronic18n.parse("aujour'dhui à 6 heures", :fr).day.should eql((Time.now.day))
  end
end
