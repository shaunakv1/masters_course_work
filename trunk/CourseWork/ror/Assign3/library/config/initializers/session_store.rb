# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_library_session',
  :secret      => 'ad0aa3680a428d1717a450f0e898a510ef744d263a46614db0b78c1d1f9b4568db898d228ad9049239e0b074b56b3188a12017c9371c60397eda6e49e0477033'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
