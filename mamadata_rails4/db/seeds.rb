#encoding: utf-8 
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Person.create(name: "Heide", fathers_name: "Witzka", gender: "male", date_of_birth: "16-01-1991", place_of_birth: "Hamburg", native_place: "Hamburg",  name_of_the_house: "Rathaus", number_of_the_house: "1", name_of_the_street: "Rathausmarkt", city: "Hamburg", pin_code: 20095, religion: "Christian", caste: "Scheduled Caste", education: "High", marital_status: "seperated", health_condition: "mentally retarded", occupation: "government employee", income: 50000)
Person.create(name: "Devils", fathers_name: "Daughter", gender: "female", date_of_birth: "16-11-2013", place_of_birth: "Hell", native_place: "Hell",  name_of_the_house: "Hurenhaus", number_of_the_house: "666", name_of_the_street: "Highway to Hell", city: "Hamburg", pin_code: 20095, religion: "goth", caste: "highest", education: "Primary", marital_status: "deserted", health_condition: "mentally retarded", occupation: "reaper", income: 500000000)
Person.create(name: "Mr", fathers_name: "Willy", gender: "male", date_of_birth: "16-01-1960", place_of_birth: "Murica", native_place: "Murica",  name_of_the_house: "Walmart", number_of_the_house: "1", name_of_the_street: "Wallstreet", city: "Murica", pin_code: 20095, religion: "Christian", caste: "Backward Class", education: "Primary", marital_status: "married", health_condition: "normal", occupation: "Bäm", income: 50000)

Role.create(name: "Beneficiary")
Role.create(name: "Father")
Role.create(name: "Mother")
Role.create(name: "Brother")
Role.create(name: "Sister")
Role.create(name: "Guardian")

sponsorship = Program.create(name: "Sponsorship", description: "")
homework = Program.create(name: "Evening Homework Help Centre", description: "")
daycare = Program.create(name: "Day Care Centre", description: "")
mobile = Program.create(name: "Mobile Library", description: "")
outrech = Program.create(name: "Outreach Program", description: "")
girls_program = Program.create(name: "Girls' Program", description: "")
spirulina = Program.create(name: "Spirulina", description: "")
vtc = Program.create(name: "VTC", description: "")
comunity = Program.create(name: "Community Development", description: "")
creches = Program.create(name: "Creches", description: "")


Benefit.create(name: "Microcredit", description: "Income Generation Programm")
Benefit.create(name: "Training and Placements", description: "Income Generation Programm")
Benefit.create(name: "Summer Camp", description: "Entertainment Acitivites")
Benefit.create(name: "Festivals/Celebrations/Visits", description: "Entertainment Acitivites")
Benefit.create(name: "Ludomobile", description: "Non-school activities")
Benefit.create(name: "Misc Classes", description: "Non-school activities")
Benefit.create(name: "Counseling", description: "Medical Activities")
Benefit.create(name: "Medical Camp", description: "Medical Activities")
Benefit.create(name: "Medical Aid", description: "Medical Activities")
Benefit.create(name: "Medical Insurance", description: "Medical Activities")
Benefit.create(name: "Emergency Relief", description: "Medical Activities")
Benefit.create(name: "Higher Education Loan/Fees", description: "School Activities")
Benefit.create(name: "School Fees", description: "School Activities")
Benefit.create(name: "Boarding Fees", description: "School Activities")
Benefit.create(name: "Mess Fees", description: "School Activities")
Benefit.create(name: "Project Fees", description: "School Activities")
Benefit.create(name: "Tuition Fees", description: "School Activities")
Benefit.create(name: "Type-writing fees", description: "School Activities")
Benefit.create(name: "Computer Fees", description: "School Activities")
Benefit.create(name: "Tailoring Course Fees", description: "School Activities")
Benefit.create(name: "Referral and Advocacy works", description: "School Activities")
Benefit.create(name: "Stipend", description: "School Activities")
Benefit.create(name: "Tuitions", description: "School Activities")
Benefit.create(name: "Required dress", description: "Clothing etc.")
Benefit.create(name: "Uniform Stitching Charges", description: "Clothing etc.")
Benefit.create(name: "Footwear", description: "Clothing etc.")
Benefit.create(name: "Cycle", description: "Transport Activities")
Benefit.create(name: "Fares and Transportation", description: "Transport Activities")
Benefit.create(name: "Auto charges", description: "ITransport Activities")
Benefit.create(name: "Provisions (grocery)", description: "Transport Activities")
Benefit.create(name: "Sport Materials", description: "Transport Activities")
Benefit.create(name: "Study Material", description: "Study Material  (Notebooks, Bag, Uniform, Books, Special Guide, Stationary)")
Benefit.create(name: "Study Instruments", description: "Study Material  (e.g Calculater, Mini Drafter, Geometry Box)")
Benefit.create(name: "Laptop", description: "Study Material")
Benefit.create(name: "Milk and snacks", description: "Nutrition Support")
Benefit.create(name: "Spirulina", description: "Nutrition Support")
Benefit.create(name: "Cerelac/ Milk/ Horlicks", description: "Nutrition Support")
Benefit.create(name: "Microcredit", description: "Nutrition Support")

sponsorship_benefits = ["Training and Placements","Summer Camp","Festivals/Celebrations/Visits","Counseling","Medical Camp","Medical Aid","Emergency Relief","Higher Education Loan/Fees","School Fees","Boarding Fees",
	"Project Fees","Tuition Fees","Type-writing fees","Computer Fees","Tailoring Course Fees","Required dress","Uniform Stitching Charges","Footwear","Cycle","Fares and Transportation","Auto charges", "Provisions (grocery)",
	"Study Material","Study Instruments","Laptop","Milk and snacks","Spirulina","Cerelac/ Milk/ Horlicks","Microcredit",]

sponsorship_benefits.each do |name|
sponsorship.add_benefit(Benefit.find_by_name(name))
end	

