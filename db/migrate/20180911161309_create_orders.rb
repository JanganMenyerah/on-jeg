class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.datetime :date
      t.integer :cost
      t.string :completed_status
      t.string :pick_up_address
      t.string :destination_address
      t.string :notes_for_driver
      t.timestamps
    end
  end
end
