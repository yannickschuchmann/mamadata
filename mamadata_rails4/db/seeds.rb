head = Role.create(name: "Head of the Household")
wife = Role.create(name: "Wife")
child = Role.create(name: "Child")
father = Role.create(name: "Father")
mother = Role.create(name: "Mother")
brother = Role.create(name: "Brother")
sister = Role.create(name: "Sister")

sponsorship = Program.create(name: "Sponsorship", description: "")
homework = Program.create(name: "Evening Homework Help Centre", description: "")
daycare = Program.create(name: "Day Care Centre", description: "")
mobile = Program.create(name: "Mobile Library", description: "")
outreach = Program.create(name: "Outreach Program", description: "")
girls_program = Program.create(name: "Girls' Program", description: "")
shelter = Program.create(name: "Shelter", description: "")
spirulina = Program.create(name: "Spirulina", description: "")
vtc = Program.create(name: "VTC", description: "")
community = Program.create(name: "Community Development", description: "")
creches = Program.create(name: "Creches", description: "")


b1 = Benefit.create(name: "Microcredit", description: "Income Generation Programm")
b2 = Benefit.create(name: "Training and Placements", description: "Income Generation Programm")
b3 = Benefit.create(name: "Summer Camp", description: "Entertainment Acitivites")
b4 = Benefit.create(name: "Festivals/Celebrations/Visits", description: "Entertainment Acitivites")
b5 = Benefit.create(name: "Ludomobile", description: "Non-school activities")
b6 = Benefit.create(name: "Misc Classes", description: "Non-school activities")
b7 = Benefit.create(name: "Counseling", description: "Medical Activities")
b8 = Benefit.create(name: "Medical Camp", description: "Medical Activities")
b9 = Benefit.create(name: "Medical Aid", description: "Medical Activities")
b10 = Benefit.create(name: "Medical Insurance", description: "Medical Activities")
b11 = Benefit.create(name: "Emergency Relief", description: "Medical Activities")
b12 = Benefit.create(name: "Higher Education Loan/Fees", description: "School Activities")
b13 = Benefit.create(name: "School Fees", description: "School Activities")
b14 = Benefit.create(name: "Boarding Fees", description: "School Activities")
b15 = Benefit.create(name: "Mess Fees", description: "School Activities")
b16 = Benefit.create(name: "Project Fees", description: "School Activities")
b17 = Benefit.create(name: "Tuition Fees", description: "School Activities")
b18 = Benefit.create(name: "Type-writing fees", description: "School Activities")
b19 = Benefit.create(name: "Computer Fees", description: "School Activities")
b20 = Benefit.create(name: "Tailoring Course Fees", description: "School Activities")
b21 = Benefit.create(name: "Referral and Advocacy works", description: "School Activities")
b22 = Benefit.create(name: "Stipend", description: "School Activities")
b23 = Benefit.create(name: "Tuitions", description: "School Activities")
b24 = Benefit.create(name: "Required dress", description: "Clothing etc.")
b25 = Benefit.create(name: "Uniform Stitching Charges", description: "Clothing etc.")
b26 = Benefit.create(name: "Footwear", description: "Clothing etc.")
b27 = Benefit.create(name: "Cycle", description: "Transport Activities")
b28 = Benefit.create(name: "Fares and Transportation", description: "Transport Activities")
b29 = Benefit.create(name: "Auto charges", description: "ITransport Activities")
b30 = Benefit.create(name: "Provisions (grocery)", description: "Transport Activities")
b31 = Benefit.create(name: "Sport Materials", description: "Transport Activities")
b32 = Benefit.create(name: "Study Material", description: "Study Material  (Notebooks, Bag, Uniform, Books, Special Guide, Stationary)")
b33 = Benefit.create(name: "Study Instruments", description: "Study Material  (e.g Calculater, Mini Drafter, Geometry Box)")
b34 = Benefit.create(name: "Laptop", description: "Study Material")
b35 = Benefit.create(name: "Milk and snacks", description: "Nutrition Support")
b36 = Benefit.create(name: "Spirulina", description: "Nutrition Support")
b37 = Benefit.create(name: "Cerelac/ Milk/ Horlicks", description: "Nutrition Support")
b38 = Benefit.create(name: "Microcredit", description: "Nutrition Support")

sponsorship.benefits << [b2,b3,b4,b7,b8,b9,b11,b12,b13,b14,b16,b17,b18,b19,b20,b24,b25,b26,b27,b28,b29,b30,b32,b33,b34,b35,b36,b37]
homework.benefits <<[b4,b5,b7,b11,b32,b35]
daycare.benefits << [b2,b3,b4,b6,b7,b8,b9,b11,b13,b14,b15,b16,b28,b32,b35,b37,b38]
mobile.benefits << [b3,b4,b6,b7,b8,b9,b11,b14,b23,b31,b32,b35,b37]
outreach.benefits << [b6,b7,b8,b9,b11,b13,b21,b24,b32,b35,b37]
girls_program.benefits << [b2,b3,b4,b6,b7,b8,b9,b11,b12,b13,b14,b15,b17,b21,b23,b24,b26,b27,b28,b29,b30,b32,b33,b35,b36,b38]
shelter.benefits << [b2,b4,b5,b6,b7,b8,b9,b11,b13,b14,b15,b20,b21,b22,b23,b24,b25,b26,b28,b29,b30,b31,b32,b33,b35,b36,b37,b38]
spirulina.benefits << [b4,b7,b9,b11,b28,b35]
vtc.benefits << [b2,b4,b7,b9,b10,b11,b22,b24,b25,b27,b32,b33,b35,b36,b38]
community.benefits << [b1,b2,b4,b5,b6,b7,b8,b9,b11,b13,b17,b21,b23,b24,b25,b26,b27,b28,b30,b31,b32,b35,b36]
creches.benefits << [b4,b6,b8,b9,b11,b24,b26,b35,b37,b38]

# Possible choices for other fields
PossibleChoices.create(property: "religion", value: "Hindi")
PossibleChoices.create(property: "religion", value: "Christian")
PossibleChoices.create(property: "religion", value: "Muslim")
PossibleChoices.create(property: "caste", value: "Scheduled Caste")
PossibleChoices.create(property: "caste", value: "Most Backward Class")
PossibleChoices.create(property: "caste", value: "Backward Class")
PossibleChoices.create(property: "occupation", value: "none")
PossibleChoices.create(property: "occupation", value: "student")
PossibleChoices.create(property: "occupation", value: "agricultural coolie")
PossibleChoices.create(property: "occupation", value: "small farmer")
PossibleChoices.create(property: "occupation", value: "industrial worker")
PossibleChoices.create(property: "occupation", value: "government employee")


staff1 = User.create(email: "admin@sharana.com", 		password: "admin", 		password_confirmation: "admin", 	role: "admin").save!(:validate => false)
staff2 = User.create(email: "supporter@sharana.com", 	password: "supporter", 	password_confirmation: "supporter", role: "supporter").save!(:validate => false)
staff3 = User.create(email: "editor@sharana.com", 		password: "editor", 	password_confirmation: "editor", 	role: "editor").save!(:validate => false)

u1 = User.create(email: "dariusch@freenet.de", password: "test", password_confirmation: "test", role: "supporter").save!(:validate => false)
u2 = User.create(email: "test@test.de", password: "test", password_confirmation: "test").save!(:validate => false)

simpsons = Family.create(name:"Simpsons")
simpsons.people.create(name: "Homer", gender: "male", role: head)
simpsons.people.create(name: "Marge",fathers_name: "Homer", gender: "female",role: wife)
simpsons.people.create(name: "Bart",fathers_name: "Homer", gender: "male", role: child)