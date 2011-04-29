class CreateDegrees < ActiveRecord::Migration
  def self.up
    create_table :degrees do |t|
      t.string :title
      t.string :abbr

      t.timestamps
    end
  end

  def self.down
    drop_table :degrees
  end
end
