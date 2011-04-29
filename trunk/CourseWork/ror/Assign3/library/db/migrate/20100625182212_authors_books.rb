class AuthorsBooks < ActiveRecord::Migration
  def self.up
    create_table :authors_books, :id => false do |t|
    t.integer :author_id
    t.integer :book_id
    t.timestamps
  end
 end


  def self.down
    drop_table :authors_books
  end
end
