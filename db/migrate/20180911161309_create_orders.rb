class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.datetime :date
      t.integer :cost
      t.string :completed_status
      t.string :pick_up_location
      t.string :destination_location
      t.string :pick_up_place_id
      t.string :destination_place_id
      t.string :notes_for_driver
      t.references :user, index: true, foreign_key: true
      t.references :driver, index: true, foreign_key: true
      t.timestamps
    end
  end
end
