class Family < ActiveRecord::Base
	has_many :people
	# has_one :head, :class_name => "People", :foreign_key => "head_id"
	belongs_to :communitydevelopment
  validates :head_id, presence: true, on: :update
  validates :name, presence: true, on: :update
  before_validation :set_name
  before_destroy :remove_comdev

  private

  def set_name
    people = self.people
    if !people.empty?
      head = people.where(role_id: 1).last
      if !head.nil?
        self.head_id = head.id
        self.name = head.fathers_name
      else
        self.head_id = ''
        self.name = ''
      end
    end
  end

  def remove_comdev
    CommunityDevelopment.find(self.community_development_id).destroy
  end
end
