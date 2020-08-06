class CreatePlots < ActiveRecord::Migration[6.0]
  def change
    create_table :plots do |t|
      t.string :title

      t.timestamps
    end
  end
end
