class PersonGodfatherFile < ActiveRecord::Base
	belongs_to :godfather_person, touch: true
	has_one :person, through: :godfather_person
	has_attached_file :file
	validates :file, presence: true
  before_create :set_file_name

  def set_file_name
    extension = File.extname(self.file_file_name).downcase
    self.file.instance_write(:file_name, "#{self.perform_file_name(self.remark)}#{extension}")
  end

  def perform_file_name remark
    self.person.id.to_s+'_'+remark.gsub('/', '_').gsub(' ', '')
  end

  def self.perform_remark remark_params
    type_of_corresp = remark_params[:typeof]
    language = remark_params[:language]
    year = remark_params["submitdate(1i)"]

    type_of_corresp+"/"+language+"/"+year
  end

end
