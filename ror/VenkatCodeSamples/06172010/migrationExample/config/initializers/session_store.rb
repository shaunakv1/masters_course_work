# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_migrationExample_session',
  :secret      => 'ca665d59daf46c1c972d9d929b95eec8f542ac12427ff4f6c820514762222b44ca6ca125b590bf79debd3ad5a109b0bcc5efd214be64a1dec27770c6f33da132'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
