class CreateHistories < ActiveRecord::Migration
  def self.up
    create_table :histories do |t|
      t.string :title
      t.string :description
      t.integer :user_id
      t.integer :receiver_id
      t.string :action
      t.integer :post_id
      t.timestamps
    end
  end

  def self.down
    drop_table :histories
  end
end
