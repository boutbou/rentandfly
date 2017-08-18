class AddColumnToDrone < ActiveRecord::Migration[5.0]
  def change
    add_column :drones, :battery, :integer
  end
end
