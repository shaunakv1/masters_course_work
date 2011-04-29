class CreateGraduates < ActiveRecord::Migration
  def self.up
    create_table :graduates do |t|
      t.string :first_name
      t.string :last_name
      t.integer :degree_id
      t.integer :year_of_graduation

      t.timestamps
    end
    
    Graduate.create(:first_name => 'John', :last_name => 'Smith', :degree_id => 1, :year_of_graduation => 2009)
    Graduate.create(:first_name => 'Jason', :last_name => 'Walker', :degree_id => 2, :year_of_graduation => 2008)
    Graduate.create(:first_name => 'Sara', :last_name => 'Smith', :degree_id => 1, :year_of_graduation => 2009)
    Graduate.create(:first_name => 'Jill', :last_name => 'Jacobs', :degree_id => 2, :year_of_graduation => 2010)
    Graduate.create(:first_name => 'Bill', :last_name => 'Smith', :degree_id => 3, :year_of_graduation => 2009)
    Graduate.create(:first_name => 'Bobby', :last_name => 'Baker', :degree_id => 2, :year_of_graduation => 2008)
    Graduate.create(:first_name => 'Buddy', :last_name => 'Johnson', :degree_id => 1, :year_of_graduation => 2009)
  end

  def self.down
    drop_table :graduates
  end
end
