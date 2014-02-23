class SchoolClass < ActiveRecord::Base
  has_attached_file :document
  #validates_attachment :document, content_type: { content_type: "application/pdf" }
  belongs_to :school
  validate :reset_file

  private

  def reset_file
    self.document_file_name = self.changed_attributes["document_file_name"] unless self.changed_attributes["document_file_name"].nil? or self.document_file_name.present?
  end
end
