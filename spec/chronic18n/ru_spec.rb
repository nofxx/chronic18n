# -*- coding: utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Russian" do

  it "should parse something" do
    Chronic18n.parse("воскресенье", lang: :ru).should be_a Time
  end

  it "should parse something with language autodetection" do
    Chronic18n.parse("воскресенье").should be_a Time
  end

  it "should parse hour" do
    Chronic18n.parse("через 7 часов", country: 'RU').hour.should eql(get_time(7 * HOURS).hour)
  end

  it "should parse minutes" do
    Chronic18n.parse("через 7 минут", lang: :ru).min.should eql((Time.now.min + 7) % 60)
  end

  it "should parse sunday" do
    Chronic18n.parse("воскресенье", lang: :ru).wday.should eql(0)
  end

  it "should parse monday" do
    Chronic18n.parse("понедельник", lang: :ru).wday.should eql(1)
    Chronic18n.parse("пн", lang: :ru).wday.should eql(1)
  end

  it "should parse monday at 20:00 (8pm)" do
    Chronic18n.parse("пн в 20:00", lang: :ru).wday.should eql(1)
    Chronic18n.parse("понедельник в 20:00", country: 'RU').wday.should eql(1)
  end

  it "should parse month" do
    Chronic18n.parse("май 3", lang: :ru).month.should eql(5)
    Chronic18n.parse("3 мая", country: 'RU').month.should eql(5)
  end

  it "should parse next month" do
    Chronic18n.parse("следующего месяца", country: 'RU').month.should eql(Time.now.month % 12 + 1)
  end

  it "should parse days" do
    Chronic18n.parse("через 3 дня", lang: :ru).day.should eql(get_time(3 * DAYS).day)
  end

  it "should parse day" do
    Chronic18n.parse("через 3 недели", lang: :ru).day.should eql(get_time(21 * DAYS).day)
  end

  it "should today at" do
    Chronic18n.parse("сегодня в 9", lang: :ru).day.should eql(Time.now.day)
  end

  it "should parse today at" do
    Chronic18n.parse("в 9", lang: :ru).day.should eql(Time.now.day)
  end

  it "should parse now" do
    Chronic18n.parse("сейчас", country: 'RU').day.should eql(Time.now.day)
  end

  it "should parse yesterday" do
    Chronic18n.parse("вчера", lang: :ru).day.should eql(get_time(-1 * DAYS).day)
  end

  it "should parse some real life examples" do
    date = Chronic18n.parse("16 марта 2011 года в 17:48", country: 'RU')
    date.day.should == 16
    date.month.should == 3
    date.year.should == 2011
    date.hour.should == 17
    date.min.should == 48
  end
end
