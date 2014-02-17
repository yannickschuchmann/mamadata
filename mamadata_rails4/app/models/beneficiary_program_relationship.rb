class BeneficiaryProgramRelationship < ActiveRecord::Base
	belongs_to :program
	belongs_to :person
	# before_save :set_active_flag

  # before_destroy { |record|
  #   self.is_active = false	
  #   self.save!
  #   false
  # }
	# private
	# 	def set_active_flag
	# 		puts "blubb"
	# 			self.is_active = true

	# 	end

end
