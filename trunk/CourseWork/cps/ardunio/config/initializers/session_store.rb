# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ardunio_session',
  :secret      => 'e608b5c35e9ba9827b16fbbf7ad3339c70c346bf15b29f1c8609cb27269916bbdbcdf457ea6e32409d448357cedec3733aad8acad8efa641f2e4cc91bc93b5b6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
