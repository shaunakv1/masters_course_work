# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ajaxExample_session',
  :secret      => 'c216a1b168b981374dacebceb698167951814e8a710e65309624b56b23b5f1423dc9c65691c8cc7b31d60f3697c875a73618eea14356f63c43d1a3f255bcbb1f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
