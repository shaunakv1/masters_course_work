class CreateReadings < ActiveRecord::Migration
  def self.up
    create_table :readings do |t|
      t.integer :station_id
      t.float :temperature
      t.float :moisture

      t.timestamps
    end
  end

  def self.down
    drop_table :readings
  end
end
