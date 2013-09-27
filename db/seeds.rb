# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#---
# encoding: utf-8

require 'rubygems'  
require 'nokogiri'  
require 'open-uri'  

Course.delete_all

xml = Nokogiri::XML(File.open("db/courses.xml"))
#xml.xpath("//course").each do |game|
#  %w[ects name].each do |n|
    #puts game.at(n)
#    puts n, game.at(n).text
#  end
#end

#xml = Nokogiri::XML(open('http://www.kongregate.com/games_for_your_site.xml'))
games = xml.search('course').map do |game|
  %w[
    ects name institute programme description
  ].each_with_object({}) do |n, o|
  if ( nil != game.at(n))
    o[n] = game.at(n).text
    
  end
  end
end

games.each do |course|
	Course.create(:Name => course['name'],
			:Ects => course['ects'],
			:Institute => course['institute'],
			:Programme => course['programme'],
			:Description => course['description'],
			)
end


#		Course.create(:Name => courses.xpath('//course/name').text,
#			:Ects => courses.xpath('//ects').text,
#			:Institute => courses.xpath('//institute').text,
#			:Programme => courses.xpath('//programme/name').text,
#			:Description => courses.xpath('//description').text,
#			)
			

