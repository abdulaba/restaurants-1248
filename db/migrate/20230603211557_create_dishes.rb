class CreateDishes < ActiveRecord::Migration[7.0]
  def change
    create_table :dishes do |t|
      t.string :name
      t.text :detail
      t.integer :price
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
