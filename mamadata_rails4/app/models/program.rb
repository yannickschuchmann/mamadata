class Program < ActiveRecord::Base
	has_many :program_benefit_relationships
	has_many :benefits, through: :program_benefit_relationships
	has_many :benefit_incidents
	has_many :beneficiary_program_relationships
	has_many :people, through: :beneficiary_program_relationships
	has_many  :active_people, -> { where is_active: true }, class_name: 'BeneficiaryProgramRelationship'
	validates :name, presence: true
  validates :description, presence: true



	def get_total_amount(status=true, date=nil)
		total_amount=Money.new(0)
		if date.nil?
      benefit_incidents = self.benefit_incidents
    else
    	benefit_incidents = status==true ? self.benefit_incidents.where('date_granted >= :date', :date => date) : self.benefit_incidents.where('created_at >= :date', :date => date)
    end
    benefit_incidents.each do |benefit|
      if(benefit.status == status)
        total_amount+=benefit.amount
      end
    end
    return total_amount
  end

  def get_amount_year_to_date(status=true)
	  self.get_total_amount(status, Date.today.beginning_of_financial_year)
  end

end