head = Role.find_or_create_by(name: "Head of the Household")
wife = Role.find_or_create_by(name: "Wife")
child = Role.find_or_create_by(name: "Child")
father = Role.find_or_create_by(name: "Father")
mother = Role.find_or_create_by(name: "Mother")
brother = Role.find_or_create_by(name: "Brother")
sister = Role.find_or_create_by(name: "Sister")

DonorType.find_or_create_by(name: "Sharana France")
DonorType.find_or_create_by(name: "Social Business Stiftung Hamburg")




sponsorship = Program.find_or_create_by(name: "Sponsorship", description: "")
homework = Program.find_or_create_by(name: "Evening Homework Help Centre", description: "")
daycare = Program.find_or_create_by(name: "Day Care Centre", description: "")
mobile = Program.find_or_create_by(name: "Mobile Library", description: "")
outreach = Program.find_or_create_by(name: "Outreach Program", description: "")
girls_program = Program.find_or_create_by(name: "Girls' Program", description: "")
shelter = Program.find_or_create_by(name: "Shelter", description: "")
spirulina = Program.find_or_create_by(name: "Spirulina", description: "")
vtc = Program.find_or_create_by(name: "VTC", description: "")
community = Program.find_or_create_by(name: "Community Development", description: "")
creches = Program.find_or_create_by(name: "Creches", description: "")
# benefit_dependent = Program.find_or_create_by(name: "Benefit Dependent", description: "Has every Benefit")


b1 = Benefit.find_or_create_by(category: "none",category: "none",name: "Microcredit", description: "Income Generation Programm")
b2 = Benefit.find_or_create_by(category: "none",name: "Training and Placements", description: "Income Generation Programm")
b3 = Benefit.find_or_create_by(category: "none",name: "Summer Camp", description: "Entertainment Acitivites")
b4 = Benefit.find_or_create_by(category: "none",name: "Festivals/Celebrations/Visits", description: "Entertainment Acitivites")
b5 = Benefit.find_or_create_by(category: "none",name: "Ludomobile", description: "Non-school activities")
b6 = Benefit.find_or_create_by(category: "none",name: "Misc Classes", description: "Non-school activities")
b7 = Benefit.find_or_create_by(category: "none",name: "Counseling", description: "Medical Activities")
b8 = Benefit.find_or_create_by(category: "none",name: "Medical Camp", description: "Medical Activities")
b9 = Benefit.find_or_create_by(category: "none",name: "Medical Aid", description: "Medical Activities")
b10 = Benefit.find_or_create_by(category: "none",name: "Medical Insurance", description: "Medical Activities")
b11 = Benefit.find_or_create_by(category: "none",name: "Emergency Relief", description: "Medical Activities")
b12 = Benefit.find_or_create_by(category: "none",name: "Higher Education Loan/Fees", description: "School Activities")
b13 = Benefit.find_or_create_by(category: "none",name: "School Fees", description: "School Activities")
b14 = Benefit.find_or_create_by(category: "none",name: "Boarding Fees", description: "School Activities")
b15 = Benefit.find_or_create_by(category: "none",name: "Mess Fees", description: "School Activities")
b16 = Benefit.find_or_create_by(category: "none",name: "Project Fees", description: "School Activities")
b17 = Benefit.find_or_create_by(category: "none",name: "Tuition Fees", description: "School Activities")
b18 = Benefit.find_or_create_by(category: "none",name: "Type-writing fees", description: "School Activities")
b19 = Benefit.find_or_create_by(category: "none",name: "Computer Fees", description: "School Activities")
b20 = Benefit.find_or_create_by(category: "none",name: "Tailoring Course Fees", description: "School Activities")
b21 = Benefit.find_or_create_by(category: "none",name: "Referral and Advocacy works", description: "School Activities")
b22 = Benefit.find_or_create_by(category: "none",name: "Stipend", description: "School Activities")
b23 = Benefit.find_or_create_by(category: "none",name: "Tuitions", description: "School Activities")
b24 = Benefit.find_or_create_by(category: "none",name: "Required dress", description: "Clothing etc.")
b25 = Benefit.find_or_create_by(category: "none",name: "Uniform Stitching Charges", description: "Clothing etc.")
b26 = Benefit.find_or_create_by(category: "none",name: "Footwear", description: "Clothing etc.")
b27 = Benefit.find_or_create_by(category: "none",name: "Cycle", description: "Transport Activities")
b28 = Benefit.find_or_create_by(category: "none",name: "Fares and Transportation", description: "Transport Activities")
b29 = Benefit.find_or_create_by(category: "none",name: "Auto charges", description: "ITransport Activities")
b30 = Benefit.find_or_create_by(category: "none",name: "Provisions (grocery)", description: "Transport Activities")
b31 = Benefit.find_or_create_by(category: "none",name: "Sport Materials", description: "Transport Activities")
b32 = Benefit.find_or_create_by(category: "none",name: "Study Material", description: "Study Material  (Notebooks, Bag, Uniform, Books, Special Guide, Stationary)")
b33 = Benefit.find_or_create_by(category: "none",name: "Study Instruments", description: "Study Material  (e.g Calculater, Mini Drafter, Geometry Box)")
b34 = Benefit.find_or_create_by(category: "none",name: "Laptop", description: "Study Material")
b35 = Benefit.find_or_create_by(category: "none",name: "Milk and snacks", description: "Nutrition Support")
b36 = Benefit.find_or_create_by(category: "none",name: "Spirulina", description: "Nutrition Support")
b37 = Benefit.find_or_create_by(category: "none",name: "Cerelac/ Milk/ Horlicks", description: "Nutrition Support")
b38 = Benefit.find_or_create_by(category: "none",name: "Microcredit", description: "Nutrition Support")

# benefit_with_amount1 = Benefit.find_or_create_by(category: "none",name: "Benefit with Calculated Amount 1", description: "", optional_amount: 20000, max_people: 10)

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
# benefit_dependent.benefits <<[b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15,b16,b17,b18,b19,b20,b21,b22,b23,b24,b25,b26,b27,b28,b29,b30,b31,b32,b33,b34,b35,b36,b37,b38]


# Possible choices for other fields
PossibleChoices.find_or_create_by(property: "religion", value: "Hindi")
PossibleChoices.find_or_create_by(property: "religion", value: "Christian")
PossibleChoices.find_or_create_by(property: "religion", value: "Muslim")
PossibleChoices.find_or_create_by(property: "caste", value: "Scheduled Caste")
PossibleChoices.find_or_create_by(property: "caste", value: "Most Backward Class")
PossibleChoices.find_or_create_by(property: "caste", value: "Backward Class")
PossibleChoices.find_or_create_by(property: "occupation", value: "none")
PossibleChoices.find_or_create_by(property: "occupation", value: "student")
PossibleChoices.find_or_create_by(property: "occupation", value: "agricultural coolie")
PossibleChoices.find_or_create_by(property: "occupation", value: "small farmer")
PossibleChoices.find_or_create_by(property: "occupation", value: "industrial worker")
PossibleChoices.find_or_create_by(property: "occupation", value: "government employee")
PossibleChoices.find_or_create_by(property: "house_possession", value: "father's property")
PossibleChoices.find_or_create_by(property: "house_possession", value: "bought the land")
PossibleChoices.find_or_create_by(property: "house_possession", value: "temple land")
PossibleChoices.find_or_create_by(property: "house_possession", value: "no man's land")
PossibleChoices.find_or_create_by(property: "source_of_income", value: "salary")
PossibleChoices.find_or_create_by(property: "source_of_income", value: "cattle")
PossibleChoices.find_or_create_by(property: "source_of_income", value: "agriculture")
PossibleChoices.find_or_create_by(property: "source_of_income", value: "nil")
PossibleChoices.find_or_create_by(property: "land_details", value: "own land")
PossibleChoices.find_or_create_by(property: "land_details", value: "other land")
PossibleChoices.find_or_create_by(property: "mode_of_savings", value: "bank")
PossibleChoices.find_or_create_by(property: "mode_of_savings", value: "chit-fund")
PossibleChoices.find_or_create_by(property: "reason_for_debt", value: "food")
PossibleChoices.find_or_create_by(property: "reason_for_debt", value: "housing")
PossibleChoices.find_or_create_by(property: "reason_for_debt", value: "education")
PossibleChoices.find_or_create_by(property: "reason_for_debt", value: "medicines")
PossibleChoices.find_or_create_by(property: "reason_for_debt", value: "profession")
PossibleChoices.find_or_create_by(property: "reason_for_debt", value: "functions")
PossibleChoices.find_or_create_by(property: "family_type_of_handicap", value: "visually")
PossibleChoices.find_or_create_by(property: "family_type_of_handicap", value: "mentally")
PossibleChoices.find_or_create_by(property: "family_type_of_handicap", value: "orthopedically")
PossibleChoices.find_or_create_by(property: "family_type_of_handicap", value: "hearing impaired")


if User.count == 0
staff1 = User.create(email: "admin@sharana.org", 		password: "admin", 		password_confirmation: "admin", 	role: "admin").save!(:validate => false)
staff2 = User.create(email: "supporter@sharana.org", 	password: "supporter", 	password_confirmation: "supporter", role: "supporter").save!(:validate => false)
staff3 = User.create(email: "accountant@sharana.org", 		password: "accountant", 	password_confirmation: "accountant", 	role: "accountant").save!(:validate => false)
staff4 = User.create(email: "socialworker@sharana.org", 	password: "socialworker", 	password_confirmation: "socialworker", role: "social_worker").save!(:validate => false)
end
# u1 = User.find_or_create_by(email: "dariusch@freenet.de", password: "test", password_confirmation: "test", role: "supporter").save!(:validate => false)
# u2 = User.find_or_create_by(email: "test@test.de", password: "test", password_confirmation: "test").save!(:validate => false)

# Supporter.find_or_create_by(organisation: "none", name: "Thomas", family_name: "Gottschalk",email: "thomas@gottschalk.de", godfather: true, is_volunteer: false, type_of_work: "marketing").save!(:validate => false)
# Supporter.find_or_create_by(organisation: "none", name: "Guenther", family_name: "Jauch",email: "guenther@jauch.de", godfather: true, is_volunteer: false, type_of_work: "marketing").save!(:validate => false)
# Supporter.find_or_create_by(organisation: "none", name: "Oliver", family_name: "Geissen",email: "oliver@geissen.de", godfather: false, is_volunteer: true, type_of_work: "volunteering").save!(:validate => false)

# simpsons = Family.find_or_create_by(name:"Simpsons")
#Person.find_or_create_by(name: "Homer", gender: "male", role: head, program_ids: ["8"], city: "München")
#Person.find_or_create_by(name: "Marge",fathers_name: "Homer", gender: "female",role: wife, city: "Aachen")
#Person.find_or_create_by(name: "Bart",fathers_name: "Homer", gender: "male", role: child, city: "Mainz")