#User creating

#4 Roles, admin, supporter, editor, guest => default
staff1 = User.create(email: "admin@sharana.com", 		password: "admin", 		password_confirmation: "admin", 	role: "admin").save!(:validate => false)
staff2 = User.create(email: "supporter@sharana.com", 	password: "supporter", 	password_confirmation: "supporter", role: "supporter").save!(:validate => false)
staff3 = User.create(email: "editor@sharana.com", 		password: "editor", 	password_confirmation: "editor", 	role: "editor").save!(:validate => false)

u1 = User.create(email: "dariusch@freenet.de", password: "test", password_confirmation: "test", role: "supporter").save!(:validate => false)
u2 = User.create(email: "test@test.de", password: "test", password_confirmation: "test").save!(:validate => false)

simpsons = Family.create(name:"Simpsons")
simpsons.people.create(name: "Homer", gender: "male", role: head)
simpsons.people.create(name: "Marge",fathers_name: "Homer", gender: "female",role: wife)
simpsons.people.create(name: "Bart",fathers_name: "Homer", gender: "male", role: child)

Person.create(name: "1Heide", fathers_name: "Homer", gender: "male", date_of_birth: "16-01-1991", place_of_birth: "Hamburg", native_place: "Hamburg",  name_of_the_house: "Rathaus", number_of_the_house: "1", name_of_the_street: "Rathausmarkt", city: "Hamburg", pin_code: 20095, religion: "Christian", caste: "Scheduled Caste", education: "High", marital_status: "seperated", health_condition: "mentally retarded", occupation: "government employee", income: 50000)
Person.create(name: "2Devils", father_id: 4, mother_id: 5, fathers_name: "Daughter", gender: "female", date_of_birth: "16-11-2013", place_of_birth: "Hell", native_place: "Hell",  name_of_the_house: "Hurenhaus", number_of_the_house: "666", name_of_the_street: "Highway to Hell", city: "Hamburg", pin_code: 20095, religion: "goth", caste: "highest", education: "Primary", marital_status: "deserted", health_condition: "mentally retarded", occupation: "reaper", income: 500000000)
Person.create(name: "3Mr", father_id: 6, mother_id: 7, fathers_name: "Willy", gender: "male", date_of_birth: "16-01-1960", place_of_birth: "Murica", native_place: "Murica",  name_of_the_house: "Walmart", number_of_the_house: "1", name_of_the_street: "Wallstreet", city: "Murica", pin_code: 20095, religion: "Christian", caste: "Backward Class", education: "Primary", marital_status: "married", health_condition: "normal", occupation: "Bäm", income: 50000)
