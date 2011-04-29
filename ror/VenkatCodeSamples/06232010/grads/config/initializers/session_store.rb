# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_grads_session',
  :secret      => '8c2b16d0cc361a97e5720b3440ed26c70c1899799a55735ac5a7663a4024214e798c334e66416fb6ef7769d7e1dd4f1ee64021ac3fce970f2fe71520c3050655'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
