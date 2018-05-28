class CreateGps < ActiveRecord::Migration[5.0]
  def change
    create_table :gps do |t|
      t.float :latitude
      t.float :longitude
      t.datetime :sent_at
      t.string :vehicle_identifier

      t.timestamps
    end
  end
end
