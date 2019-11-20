require 'spec_helper'

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
    Chronic18n.parse("le mois prochain", lang: :fr).month.should eql(Time.now.month % 12 + 1)
  end

  it "should parse next month and autodetect language" do
    Chronic18n.parse("le mois prochain").month.should eql(Time.now.month % 12 + 1)
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

  it "should parse 4 years ago" do
    date = Chronic18n.parse("Offre postée il y a 4 ans", country: 'FR')
    date.year.should == Time.now.year - 4
  end

  describe '#parse' do
    let(:lang) { 'fr' }
    let(:country) { 'FR' }

    around do |example|
      Timecop.freeze(2018, 4, 4) do
        example.run
      end
    end

    {
      '20 février 2018' => '20 Feb 2018',
      'lundi 1er février 2016' => '1 Feb 2016',
      '4 janv. 2018' => '4 Jan 2018',
      '4 févr. 2018' => '4 Feb 2018',
      '4 avr. 2018' => '4 Apr 2018',
      '4 juil. 2018' => '4 Jul 2018',
      '4 sept. 2018' => '4 Sep 2018',
      '4 oct. 2018' => '4 Oct 2018',
      '4 nov. 2018' => '4 Nov 2018',
      '6 déc. 2017' => '6 Dec 2017'
    }.each do |source, parsed|
      it "parses #{source} as #{parsed}" do
        Chronic18n.parse(source, country: country).to_date.should == Date.parse(parsed)
      end
    end

    it "parses date, ignores time" do
      date = Chronic18n.parse("Jeudi, novembre 30, 2017 - 10:15", country: 'FR').to_date
      date.should == Date.new(2017, 11, 30)
    end
  end
end
