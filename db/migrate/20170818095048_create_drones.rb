class CreateDrones < ActiveRecord::Migration[5.0]
  def change
    create_table :drones do |t|
      t.references :user, foreign_key: true
      t.string :brand
      t.string :model
      t.integer :daily_price
      t.integer :weekly_deal
      t.integer :monthly_deal
      t.boolean :available
      t.integer :autonomy
      t.integer :range
      t.boolean :controller
      t.integer :deposit
      t.text :description

      t.timestamps
    end
  end
end
