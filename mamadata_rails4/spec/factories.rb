FactoryGirl.define do
  factory :program do
    name     "Sample Program"
    description    "Sample Program Description"
  end

  factory :benefit do
  	name "Sample Benefit"
  	description "Sample Benefit Description"
  end

  factory :person do
  	name "Homer"
  	gender "male"
  end
end