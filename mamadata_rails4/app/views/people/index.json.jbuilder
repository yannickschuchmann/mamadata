json.array!(@people) do |person|
  json.extract! person, :name, :fathers_name, :gender, :date_of_birth, :place_of_birth, :native_place, :name_of_the_house, :number_of_the_house, :name_of_the_street, :city, :zip_code, :religion, :caste, :education, :marital_status, :health_condition, :occupation, :income, :role_id
  json.url person_url(person, format: :json)
end
