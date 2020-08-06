class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :alignment
      t.string :species
      t.string :character_class
      t.text :description

      t.integer :world_id
      t.integer :user_id

      t.timestamps
    end
  end
end
