# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

FACEBOOK_GRAPH_BASE_URL     = "https://graph.facebook.com/v7.0/".freeze
FACEBOOK_WEBHOOK_VERIFY_KEY = "AAAAAAAABBBBBBBBCCCCCCCCDDDDDDDDabcd".freeze
# rubocop:disable Layout/LineLength
FACEBOOK_PAGE_ACCESS_TOKEN  = "EAAJupkZAzB6EBAEStNHUZBdPWJImDCU2qiOJHX8kySzUjCkR9rp9wlYstFmYH5JOVeEF1XUsE8DUKLZAZCceMOncbB8ZAjeYybsbdEapvODbrMpY3Vv9BCK4CYjftwX4Qcckh0WLGyCgLCOAD2AqS6JZCkllqBeUMYezmBhPgQFY59sxZAZBd6vk".freeze
# rubocop:enable Layout/LineLength
