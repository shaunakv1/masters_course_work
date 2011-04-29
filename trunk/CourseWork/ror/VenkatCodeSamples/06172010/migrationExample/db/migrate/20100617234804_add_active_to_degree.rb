class AddActiveToDegree < ActiveRecord::Migration
  def self.up
    add_column :degrees, :active, :boolean
    Degree.create(:title => 'Bachelor of Science',
     :abbr => 'BS', :years => 4, :active => 1)
  end

  def self.down
    remove_column :degrees, :active
  end
end
