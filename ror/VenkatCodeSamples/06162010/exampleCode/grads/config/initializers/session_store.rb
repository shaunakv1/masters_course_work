# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_grads_session',
  :secret      => '883459e13fbf895993cd4b05010a5b0fa1da35b6bcd54f3c439b6433cd395d2be852c48dd65225b3309adb7b2ab40c33ffa35ac36ada0dcf78e267f3be537c51'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
