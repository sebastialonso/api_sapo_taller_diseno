class CreateSightings < ActiveRecord::Migration
  def change
    create_table :sightings do |t|
      t.decimal :lat
      t.decimal :lon
      t.integer :time
      t.boolean :direction
      t.integer :bus_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
