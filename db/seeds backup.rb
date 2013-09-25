# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#---
# encoding: utf-8
Course.delete_all
Course.create(:Name => 'Chemical Analysis for Forensic Evidence (CAFE)',
  :Ects => 6,
  :Institute => 'Masters School of Sciences',
  :Programme => 'Master\'s in Chemistry, track Analytical Sciences',
  :Description => 'Analytical chemistry is a pervasive science in the forensic field. Many different types of forensic samples are subjected to chemical    		analysis. The types of samples, sample handling and sample preparation are briefly discussed. Analytical methods are described in two different ways. A technical perspective is offered for those students that are not yet familiar with forensic science. An example-driven forensic perspective is used to illustrate the application of a variety of methods in practice. The possibilities and limitations of analytical methods are discussed. Attention will be paid to special requirements of chemical analysis in a forensic context (quality, traceability, contamination. An important aspect of the course is a meaningful interpretation of the data, based on (Bayesian) statistics. The ultimate objective is to translate analytical data into solid evidence.',
  )
# . . .

Course.create(:Name => 'Theorie en praktijk van het vertalen',
  :Ects => 12,
  :Institute => 'Taal- en letterkunde',
  :Programme => 'Keuzevakken en minors Taal- en letterkunde (BA)',
  :Description => 'De cursus bestaat uit een theoretisch en een praktisch gedeelte. In het theoretische gedeelte wordt een overzicht gegeven van de verschillende soorten vertaling: schriftelijk versus mondeling, interlinguaal versus intralinguaal en intersemiotisch etc. Het historisch overzicht van het denken over vertalen vormt de aanleiding tot een systematisch overzicht van hedendaagse vertaalopvattingen en van terugkerende discussies in de reflectie over het vertalen.',
  )
# . . .

Course.create(:Name => 'Onderwijssociologie',
  :Ects => 6,
  :Institute => 'College Pedagogiek, Onderwijskunde en Lerarenopleiding',
  :Programme => 'Bachelor Onderwijskunde',
  :Description => 'Algemeen gesproken is de module opgezet als een plaatsing van het onderwijs in wat in de sociologie de dynamiek van de moderniteit wordt genoemd.',
  )
