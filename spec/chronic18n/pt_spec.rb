# -*- coding: utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Portuguese" do
  it "should parse something" do
    Chronic18n.parse("domingo", lang: :pt).should be_a Time
  end

  it "should parse hour" do
    Chronic18n.parse("daqui 7 horas", lang: :pt).hour.should eql(get_time(7 * HOURS).hour)
    Chronic18n.parse("daqui a 7 horas", lang: :pt).hour.should eql(get_time(7 * HOURS).hour)
  end

  it "should parse hour" do
    Chronic18n.parse("em 7 minutos", lang: :pt).min.should eql((Time.now.min + 7) % 60)
    Chronic18n.parse("daqui a 7 minutos", lang: :pt).min.should eql((Time.now.min + 7) % 60)
  end

  it "should parse sunday" do
    Chronic18n.parse("domingo", lang: :pt).wday.should eql(0)
  end

  it "should parse monday" do
    Chronic18n.parse("segunda", lang: :pt).wday.should eql(1)
    Chronic18n.parse("segunda-feira", country: 'BR').wday.should eql(1)
    Chronic18n.parse("seg", lang: :pt).wday.should eql(1)
  end

  it "should parse monday at 20:00 (8pm)" do
    Chronic18n.parse("seg as 20:00", lang: :pt).wday.should eql(1)
    Chronic18n.parse("segunda as 20:00", lang: :pt).wday.should eql(1)
  end

  it "should parse month" do
    Chronic18n.parse("maio 3", lang: :pt).month.should eql(5)
    Chronic18n.parse("3 de maio", lang: :pt).month.should eql(5)
  end

  it "should parse next month" do
    Chronic18n.parse("mes que vem", country: 'BR').month.should eql((Time.now.month + 1) % 12)
    Chronic18n.parse("proximo mes", country: :pt).month.should eql((Time.now.month + 1) % 12)
    Chronic18n.parse("proximo mês", lang: :pt).month.should eql((Time.now.month + 1) % 12)
    Chronic18n.parse("próximo mes", lang: :pt).month.should eql((Time.now.month + 1) % 12)
    Chronic18n.parse("próximo mês", lang: :pt).month.should eql((Time.now.month + 1) % 12)
  end

  it "should parse days" do
    Chronic18n.parse("daqui 3 dias", lang: :pt).day.should eql(get_time(3 * DAYS).day)
  end

  it "should parse day" do
    Chronic18n.parse("daqui 3 semanas", lang: :pt).day.should eql(get_time(21 * DAYS).day)
  end

  it "should today at" do
    Chronic18n.parse("hoje às 9", country: :pt).day.should eql(Time.now.day)
  end

  it "should parse now" do
    Chronic18n.parse("agora", lang: :pt).day.should eql(Time.now.day)
  end

  it 'should parse regardless of case' do
    date = Chronic18n.parse("Outubro 12, 2015", country: 'BR')
    date.day.should == 12
    date.month.should == 10
    date.year.should == 2015
  end

  it 'should parse regardless of ordering' do
    date = Chronic18n.parse("12 Outubro, 2015", country: 'BR')
    date.day.should == 12
    date.month.should == 10
    date.year.should == 2015
  end

  it 'should parse regardless of abbreviation' do
    date = Chronic18n.parse("12 fev. 2015", country: 'BR')
    date.day.should == 12
    date.month.should == 2
    date.year.should == 2015
  end
end
