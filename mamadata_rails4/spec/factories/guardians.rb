# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :guardian do
    community_development nil
    name "MyString"
    age "MyString"
    sex "MyString"
    relationship_beneficiary "MyString"
    religion "MyString"
    caste "MyString"
    educational_qualification "MyString"
    occupation "MyString"
    income "MyString"
    employment_kind "MyString"
    pension "MyString"
    aadhar_card false
    voters_id false
    bank_account false
    shg false
    criminal_cases false
    physically_challenged false
    illness "MyString"
    alcoholic false
  end
end
