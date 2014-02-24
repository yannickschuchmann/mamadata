class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :people, foreign_key: 'created_by'
  has_many :program_adders, class_name: 'BeneficiaryProgramRelationship', foreign_key: 'added_by'
  has_many :program_deleters, class_name: 'BeneficiaryProgramRelationship', foreign_key: 'deleted_by'
  has_many :incident_creators, class_name: 'BenefitIncident', foreign_key: 'created_by'
  has_many :incident_granters, class_name: 'BenefitIncident', foreign_key: 'granted_by'



  def self.current
    Thread.current[:user]
  end
  def self.current=(user)
    Thread.current[:user] = user
  end




  
end
