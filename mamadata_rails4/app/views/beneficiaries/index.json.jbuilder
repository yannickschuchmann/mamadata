json.array!(@beneficiaries) do |beneficiary|
  json.extract! beneficiary, :program_id, :school_name, :school_type, :school_language, :school_class, :narrative_text, :godfather_id, :status
  json.url beneficiary_url(beneficiary, format: :json)
end
