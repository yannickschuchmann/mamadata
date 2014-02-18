class Family < ActiveRecord::Base
	has_many :people
	# has_one :head, :class_name => "People", :foreign_key => "head_id"
	belongs_to :communitydevelopment
  after_save :check_empty

  private

  def check_empty
    if self.people.empty?
      #self.community_development.destroy unless self.community_development.nil?#
      #self.destroy
    end
  end
end
