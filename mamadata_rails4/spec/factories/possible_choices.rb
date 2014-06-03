# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :possible_choice, :class => 'PossibleChoices' do
    property "MyString"
    value "MyString"
  end
end
