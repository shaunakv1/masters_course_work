class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.string :subject
      t.string :body
      t.integer :sender_id
      t.integer :user_id
      t.boolean :read, :default => 0
      t.integer :post_id
      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
