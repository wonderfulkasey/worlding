class CreateWorlds < ActiveRecord::Migration[6.0]
  def change
    create_table :worlds do |t|
      t.string :name
      t.string :genre
      t.text :description
      t.text :aesthetic

      t.integer :user_id

      t.timestamps
    end
  end
end
