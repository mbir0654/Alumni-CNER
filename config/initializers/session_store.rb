# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_alumni_session',
  :secret      => 'c53a35696737f5a9da608375b24ea5514da29c02ca658a9fcb7263c57ec27b18a6a1385294dedb6808ef88877f9b7d0fbd8a7126f36572f4cdcfd99660fb8e96'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
