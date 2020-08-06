class CreatePlots < ActiveRecord::Migration[6.0]
  def change
    create_table :plots do |t|
      t.string :title
      t.string :importance
      t.text :description

      t.integer :world_id
      t.integer :user_id

      t.timestamps
    end
  end
end
