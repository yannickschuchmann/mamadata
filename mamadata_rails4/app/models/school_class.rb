class SchoolClass < ActiveRecord::Base
  has_attached_file :document, styles: {thumbnail: "60x60#"}
  #validates_attachment :document, content_type: { content_type: "application/pdf" }
  belongs_to :school
end
