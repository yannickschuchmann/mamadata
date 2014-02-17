class School < ActiveRecord::Base
  belongs_to :person
  has_many :school_classes

  def class_names
    ['LKG', 'UKG']+(1..12).to_a
  end
end

class Government < School

end

class GovernmentAided < School
end

class Private < School

end

class College < School
  def class_names
    ['Semester 1', 'Semester 2']
  end
end