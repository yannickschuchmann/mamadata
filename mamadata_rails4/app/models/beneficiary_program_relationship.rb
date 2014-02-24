class BeneficiaryProgramRelationship < ActiveRecord::Base
	acts_as_paranoid
	belongs_to :program
	belongs_to :person
	belongs_to :adder, class_name: 'User', foreign_key: 'added_by'
	belongs_to :deleter, class_name: 'User', foreign_key: 'deleted_by'
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
