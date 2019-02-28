class CreateCardRunner < ActiveRecord::Migration[5.2]
  def change
    create_table :card_runners do |t|
      t.string :name
    end
  end
end
