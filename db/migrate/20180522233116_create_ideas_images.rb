class CreateIdeasImages < ActiveRecord::Migration[5.2]
  def change
    create_join_table :ideas, :images do |t|
      t.references :idea, index: true, foreign_key: true
      t.references :image, index: true, foreign_key: true

      t.timestamps
    end
  end
end
