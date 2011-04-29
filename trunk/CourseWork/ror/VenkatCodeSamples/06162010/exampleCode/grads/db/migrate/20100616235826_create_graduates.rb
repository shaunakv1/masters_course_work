class CreateGraduates < ActiveRecord::Migration
  def self.up
    create_table :graduates do |t|
      t.string :first_name
      t.string :last_name
      t.integer :year_of_graduation
      t.integer :degree_id

      t.timestamps
    end
  end

  def self.down
    drop_table :graduates
  end
end
