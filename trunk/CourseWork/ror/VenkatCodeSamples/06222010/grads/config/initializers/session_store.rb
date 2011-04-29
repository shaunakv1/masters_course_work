# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_grads_session',
  :secret      => '3fa8891b16291a2e996d9575fc3dd32229315f8a990c94ad5decb4f1663b16e6fc62d1e2ee0756f4d176dcfa47a6d322f126d2fc17f06496f0d5c8c28370e19f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
