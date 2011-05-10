ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => '../../db/development.sqlite3',
  :timeout => 10000
)
