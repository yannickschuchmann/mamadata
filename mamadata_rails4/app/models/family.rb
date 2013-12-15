class Family < ActiveRecord::Base
	has_many :people
	# has_one :head, :class_name => "People", :foreign_key => "head_id"
	belongs_to :communitydevelopment
end
