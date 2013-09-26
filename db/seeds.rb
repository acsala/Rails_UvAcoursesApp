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

Course.delete_all

f = File.open("db/examp_course.xml")
doc = Nokogiri::XML(f)
f.close

doc.xpath("//courses").each do |courses|

		Course.create(:Name => courses.xpath('//course/name').text,
			:Ects => courses.xpath('//ects').text,
			:Institute => courses.xpath('//institute').text,
			:Programme => courses.xpath('//programme/name').text,
			:Description => courses.xpath('//description').text,
			)
			
end

