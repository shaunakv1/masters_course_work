class CreateDegrees < ActiveRecord::Migration
  def self.up
    create_table :degrees do |t|
      t.string :title
      t.string :name
      t.integer :years

      t.timestamps
    end
    
    Degree.create(:title => 'Bachlor of Science', :name => 'BS', :years => 4)
    Degree.create(:title => 'Master of Science', :name => 'MS', :years => 2)
    Degree.create(:title => 'Doctor of Philosophy', :name => 'PhD', :years => 4)
  end

  def self.down
    drop_table :degrees
  end
end
