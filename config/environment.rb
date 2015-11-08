CLEF_APPLICATION_ID = "cf3e260f21708adae5827472548c77d4"
CLEF_APPLICATION_SECRET = ENV['CLEF_APPLICATION_SECRET']
CLEF_AUTHORIZE_URL = "https://clef.io/api/v1/authorize"

# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!
