# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

FACEBOOK_GRAPH_BASE_URL     = "https://graph.facebook.com/v3.2/".freeze
FACEBOOK_WEBHOOK_VERIFY_KEY = "2387c744-db7f-4034-b50e-3cf75c1e9799".freeze
FACEBOOK_PAGE_ACCESS_TOKEN  = "".freeze
