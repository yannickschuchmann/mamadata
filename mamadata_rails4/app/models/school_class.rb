class SchoolClass < ActiveRecord::Base
  has_attached_file :document
  #validates_attachment :document, content_type: { content_type: "application/pdf" }
  belongs_to :school
  has_one :person, through: :school
  validate :reset_file

  before_save :set_file_name

  def set_file_name
    extension = File.extname(self.document_file_name).downcase
    self.document.instance_write(:file_name, "#{self.perform_file_name(self.name)}#{extension}")
  end

  def perform_file_name value
    time = self.created_at.nil? ? Time.now : self.created_at.to_time
    self.person.id.to_s+'_school-class_'+value.gsub('/', '_').gsub(' ', '')+'_'+time.to_i.to_s
  end

  private

  def reset_file
    self.document_file_name = self.changed_attributes["document_file_name"] unless self.changed_attributes["document_file_name"].nil? or self.document_file_name.present?
  end
end
