class RenameAbbrInDegree < ActiveRecord::Migration
  def self.up
    rename_column :degrees, :abbr, :short_title
  end

  def self.down
    rename_column :degrees, :short_title, :abbr
  end
end
