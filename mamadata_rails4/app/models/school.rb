class School < ActiveRecord::Base
  belongs_to :person
  has_many :school_classes

  before_save :validate_termination
  before_create :terminate_previous



  def terminated?
    !terminated_at.nil?
  end

  def class_names
    ['LKG', 'UKG']+(1..12).to_a
  end

  def period
    self.joined_at.strftime("%Y")+'-'+self.terminated_at.strftime("%Y") unless self.terminated_at.nil? or self.joined_at.nil?
  end

  def sorted_classes
    self.school_classes.sort do |a, b|
      case
      when a.name.to_i + b.name.to_i == 0
        (a.name.downcase <=> b.name.downcase)*-1
      when a.name.to_i == 0 && b.name.to_i != 0
        1
      when b.name.to_i == 0 && a.name.to_i != 0
        -1
      else
        (a.name <=> b.name)*-1
      end
    end
  end

  private

  def terminate_previous
    school = School.order(created_at: :desc).first
    unless school.nil?
      school.termination_reason = 'finished'
      school.save
    end
  end

  def validate_termination
    self.terminated_at = Time.now unless self.termination_reason.nil? or !self.terminated_at.nil?
  end

end

class Government < School
  def self.model_name
    School.model_name
  end
end

class GovernmentAided < School
  def self.model_name
    School.model_name
  end
end

class Private < School
  def self.model_name
    School.model_name
  end
end

class College < School
  def self.model_name
    School.model_name
  end
  def class_names
    (1..10).map {|s| "Semester "+s.to_s}
  end
  def sorted_classes
    self.school_classes.sort do |a, b|
      (a.name.downcase <=> b.name.downcase)*-1
    end
  end
end
