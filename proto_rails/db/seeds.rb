# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Beneficiary.create({"name"=>"Dariusch Ochlast", "fathers_name"=>"Ochlast", "gender"=>"male", "date_of_birth"=>"1991-01-16", "place_of_birth"=> "Krapkowice", "native_place" => "Mainz", "house_name"=>"Paul Sudeck Haus", "house_number"=>"134", "street_name"=> "Wiesendamm", "city" => "Hamburg", "pin_code"=> 22303, "surname"=>"Ochlast", "narrative_text"=> "Hallo ich bin Dariusch und hier soll ein über 255 Zeichen langer Text rein!", "school_name"=>"HAW Hamburg", "school_class"=> "university", "health_condition"=>"normal" })
Beneficiary.create({"name"=>"Test User", "fathers_name"=>"Heidewitzka", "gender"=>"female", "date_of_birth"=>"2013-11-12", "place_of_birth"=> "Hamburg", "native_place" => "Hamburg", "house_name"=>"Paul Sudeck Haus", "house_number"=>"134", "street_name"=> "Wiesendamm", "city" => "Hamburg", "pin_code"=> 22303, "surname"=>"Heidewitzka", "narrative_text"=> "Hallo ich bin Heidewitzka ich wurde soeben von Dariusch erfunden und soll ein langer Text sein. Dies gelingt mit leider nicht so ganz also werde ich hier einfach weiterschwafeln =)", "school_name"=>"HAW Hamburg", "school_class"=> "university", "health_condition"=>"mentally retarded" })
