# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :godfather_person do
    person_id 1
    supporter_id 1
    is_current_godfather false
  end
end
