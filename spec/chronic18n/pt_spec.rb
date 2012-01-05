# -*- coding: utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

HOUR = HOURS = 3600
DAY = DAYS = 86400

def get_time(t)
  Time.at(Time.now + t)
end

describe "Portuguese" do

  it "should parse something" do
    Chronic18n.parse("domingo", :pt).should be_a Time
  end

  it "should parse hour" do
    Chronic18n.parse("daqui 7 horas", :pt).hour.should eql(get_time(7 * HOURS).hour)
    Chronic18n.parse("daqui a 7 horas", :pt).hour.should eql(get_time(7 * HOURS).hour)
  end

  it "should parse hour" do
    Chronic18n.parse("em 7 minutos", :pt).min.should eql((Time.now.min + 7) % 60)
    Chronic18n.parse("daqui a 7 minutos", :pt).min.should eql((Time.now.min + 7) % 60)
  end

  it "should parse sunday" do
    Chronic18n.parse("domingo", :pt).wday.should eql(0)
  end

  it "should parse monday" do
    Chronic18n.parse("segunda", :pt).wday.should eql(1)
    Chronic18n.parse("segunda-feira", :pt).wday.should eql(1)
    Chronic18n.parse("seg", :pt).wday.should eql(1)
  end

  it "should parse monday at 20:00 (8pm)" do
    Chronic18n.parse("seg as 20:00", :pt).wday.should eql(1)
    Chronic18n.parse("segunda as 20:00", :pt).wday.should eql(1)
  end

  it "should parse month" do
    Chronic18n.parse("maio 3", :pt).month.should eql(5)
    Chronic18n.parse("3 de maio", :pt).month.should eql(5)
  end

  it "should parse next month" do
    Chronic18n.parse("mes que vem", :pt).month.should eql((Time.now.month + 1 % 12))
    Chronic18n.parse("proximo mes", :pt).month.should eql((Time.now.month + 1 % 12))
    Chronic18n.parse("proximo mês", :pt).month.should eql((Time.now.month + 1 % 12))
    Chronic18n.parse("próximo mes", :pt).month.should eql((Time.now.month + 1 % 12))
    Chronic18n.parse("próximo mês", :pt).month.should eql((Time.now.month + 1 % 12))
  end

  it "should parse days" do
    Chronic18n.parse("daqui 3 dias", :pt).day.should eql(get_time(3 * DAYS).day)
  end

  it "should parse day" do
    Chronic18n.parse("daqui 3 semanas", :pt).day.should eql(get_time(21 * DAYS).day)
  end

  it "should today at" do
    Chronic18n.parse("hoje às 9", :pt).day.should eql(Time.now.day)
  end

  it "should parse today at" do
    Chronic18n.parse("às 9", :pt).day.should eql(Time.now.day)
    Chronic18n.parse("as 9", :pt).day.should eql(Time.now.day)
  end

  it "should parse now" do
    Chronic18n.parse("agora", :pt).day.should eql(Time.now.day)
  end

end
