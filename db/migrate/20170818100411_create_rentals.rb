class CreateRentals < ActiveRecord::Migration[5.0]
  def change
    create_table :rentals do |t|
      t.date :start_date
      t.date :end_date
      t.references :user, foreign_key: true
      t.references :drone, foreign_key: true
      t.integer :total_price
      t.string :accepted

      t.timestamps
    end
  end
end
