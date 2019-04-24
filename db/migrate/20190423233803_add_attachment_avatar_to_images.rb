class AddAttachmentAvatarToImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.attachment :avatar
    end
  end

end
