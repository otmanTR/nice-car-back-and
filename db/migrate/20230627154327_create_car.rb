class CreateCar < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :name
      t.string :image
      t.integer :model
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
