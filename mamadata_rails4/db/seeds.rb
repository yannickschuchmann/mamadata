# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#encoding: utf-8 
Person.create(name: "Heide", fathers_name: "Witzka", gender: "male", date_of_birth: "16-01-1991", place_of_birth: "Hamburg", native_place: "Hamburg",  name_of_the_house: "Rathaus", number_of_the_house: "1", name_of_the_street: "Rathausmarkt", city: "Hamburg", pin_code: 20095, religion: "Christian", caste: "Scheduled Caste", education: "High", marital_status: "seperated", health_condition: "mentally retarded", occupation: "government employee", income: 50000)
Person.create(name: "Devils", fathers_name: "Daughter", gender: "female", date_of_birth: "16-11-2013", place_of_birth: "Hell", native_place: "Hell",  name_of_the_house: "Hurenhaus", number_of_the_house: "666", name_of_the_street: "Highway to Hell", city: "Hamburg", pin_code: 20095, religion: "goth", caste: "highest", education: "Primary", marital_status: "deserted", health_condition: "mentally retarded", occupation: "reaper", income: 500000000)
Person.create(name: "Mr", fathers_name: "Willy", gender: "male", date_of_birth: "16-01-1960", place_of_birth: "Murica", native_place: "Murica",  name_of_the_house: "Walmart", number_of_the_house: "1", name_of_the_street: "Wallstreet", city: "Murica", pin_code: 20095, religion: "Christian", caste: "Backward Class", education: "Primary", marital_status: "married", health_condition: "normal", occupation: "Bäm", income: 50000)

Role.create(name: "Beneficiary")
Role.create(name: "Father")
Role.create(name: "Mother")
Role.create(name: "Brother")
Role.create(name: "Sister")
Role.create(name: "Guardian")
