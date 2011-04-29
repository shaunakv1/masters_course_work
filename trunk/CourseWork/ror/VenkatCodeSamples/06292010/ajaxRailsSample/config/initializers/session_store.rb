# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ajaxRailsSample_session',
  :secret      => '4736d7ed02f709d7e3ac8bd8102136b56b505b386783f0e9b6d6961a73e9916605f8be68a4f869390d20717aea35b16b61859b43a274201d7274cddb21c60f7b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
