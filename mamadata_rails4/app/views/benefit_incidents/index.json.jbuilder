json.array!(@benefit_incidents) do |benefit_incident|
  json.extract! benefit_incident, :user_id, :program_benefit_relationship_id, :amount, :remark
  json.url benefit_incident_url(benefit_incident, format: :json)
end
