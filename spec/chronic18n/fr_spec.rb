require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "French" do

  it "should parse something" do
    Chronic18n.parse("lundi", lang: :fr).should be_a Time
  end

  it "should parse hour" do
    Chronic18n.parse("dans 7 heures", lang: :fr).hour.should eql((Time.now.hour + 7) % 24)
  end

  it "should parse hour" do
    Chronic18n.parse("dans 7 minutes", lang: :fr).min.should eql((Time.now.min + 7) % 60)
  end

  it "should parse sunday" do
    Chronic18n.parse("dimanche", lang: :fr).wday.should eql(0)
  end

  it "should parse monday" do
    Chronic18n.parse("lundi", lang: :fr).wday.should eql(1)
  end

  it "should parse day" do
    Chronic18n.parse("3 mai", lang: :fr).month.should eql(5)
  end

  it "should parse month" do
    Chronic18n.parse("mars", lang: :fr).month.should eql(3)
  end

  it "should parse next month" do
    Chronic18n.parse("le mois prochain", lang: :fr).month.should eql(((Time.now.month + 1) % 12))
  end

  it "should parse today" do
    Chronic18n.parse("aujour'dhui à 6 heures", country: 'FR').day.should eql((Time.now.day))
  end

  it "should parse 2 weeks ago" do
    date = Chronic18n.parse("deux semaines", country: 'FR')
    days_ago = Date.today - 14
    date.to_date.should == days_ago.to_date
  end

  it "should parse a week ago" do
    date = Chronic18n.parse("une semaine", country: 'FR')
    days_ago = Date.today - 7
    date.to_date.should == days_ago.to_date
  end

  it "should parse 16 minutes ago" do
    date = Chronic18n.parse("Il y a 16 minutes", country: 'FR')
    against = (Time.now.min - 16) % 60
    date.min.should == against
  end
end
