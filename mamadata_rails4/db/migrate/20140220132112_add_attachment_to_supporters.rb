class AddAttachmentToSupporters < ActiveRecord::Migration
  def change
    add_column :supporters, :avatar, :attachment
  end
end
