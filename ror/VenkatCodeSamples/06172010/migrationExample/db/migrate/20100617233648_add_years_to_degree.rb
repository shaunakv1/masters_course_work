class AddYearsToDegree < ActiveRecord::Migration
  def self.up
    add_column :degrees, :years, :integer
  end

  def self.down
    remove_column :degrees, :years
  end
end
