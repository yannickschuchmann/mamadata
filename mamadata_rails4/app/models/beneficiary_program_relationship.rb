class BeneficiaryProgramRelationship < ActiveRecord::Base
	belongs_to :program
	belongs_to :person
	# before_save :set_active_flag


	# private
	# 	def set_active_flag
	# 		puts "blubb"
	# 			self.is_active = true

	# 	end

end
