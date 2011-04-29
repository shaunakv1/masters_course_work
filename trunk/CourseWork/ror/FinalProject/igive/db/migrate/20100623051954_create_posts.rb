class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.string :tag
      t.integer :user_id
      t.integer :dibber, :default => 0
      t.boolean :exchanged, :default => 0
      #t.integer :history_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
