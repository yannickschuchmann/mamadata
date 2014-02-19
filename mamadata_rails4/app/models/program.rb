class Program < ActiveRecord::Base
	has_many :program_benefit_relationships
	has_many :benefits, through: :program_benefit_relationships
	has_many :benefit_incidents
	has_many :beneficiary_program_relationships
	has_many :people, through: :beneficiary_program_relationships
	has_many  :active_people, -> { where is_active: true }, class_name: 'BeneficiaryProgramRelationship'
	validates :name, presence: true




	def get_total_amount(status=true)
		benefit_incidents = BenefitIncident.where(program_id: self.id)
		total_amount=Money.new(0)
    benefit_incidents.each do |benefit|
      if(benefit.status == status)
        total_amount+=benefit.amount
      end
    end
    return total_amount
  end

end