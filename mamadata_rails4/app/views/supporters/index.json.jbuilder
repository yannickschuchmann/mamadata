json.array!(@supporters) do |supporter|
  json.extract! supporter,:organisation, :name, :family_name, :date_of_birth, :country, :city, :street, :zipcode, :email, :website, :telephone_number, :godfather, :is_volunteer, :begin_of_work, :end_of_work, :type_of_work
  json.url supporter_url(supporter, format: :json)
end
