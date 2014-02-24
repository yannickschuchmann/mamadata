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
    fathers_name "b"
    gender "male"
    date_of_birth DateTime.now
    place_of_birth "aa"
    native_place "bb"
    name_of_the_house "cc"
    number_of_the_house "cc"
    name_of_the_street "aa"
    city "bb"
    zip_code "c"
    religion "abab"
    caste "ababab"
    education "abab"
    marital_status "abab"
    health_condition "ababab"
    occupation "abbab"
    narrative_text "ababa"
  end
end