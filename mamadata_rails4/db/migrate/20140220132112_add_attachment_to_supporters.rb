class AddAttachmentToSupporters < ActiveRecord::Migration
  def self.up
    change_table :supporters do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :supporters, :avatar
  end
end
