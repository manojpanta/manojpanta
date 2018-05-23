class RenameJointables < ActiveRecord::Migration[5.2]
  def change
    rename_table :ideas_images, :idea_images
  end
end
