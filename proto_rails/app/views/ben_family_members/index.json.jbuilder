json.array!(@ben_family_members) do |ben_family_member|
  json.extract! ben_family_member, :beneficiary, :relation, :status, :name, :surname, :date_of_birth, :profession, :income
  json.url ben_family_member_url(ben_family_member, format: :json)
end
