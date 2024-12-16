# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'

# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/rails'

# Auto-require supporting files in `spec/support` and its subdirectories
# Exclude files ending with `_spec.rb` to prevent duplicate spec runs
Dir[Rails.root.join('spec/support/**/*.rb')].sort.each { |file| require file }

# Check for pending migrations and apply them before tests
# Remove or customize this if you're not using ActiveRecord
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

# Configure RSpec
RSpec.configure do |config|
  # Configure the fixture path for ActiveRecord
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # Use transactional fixtures for tests using ActiveRecord
  config.use_transactional_fixtures = true

  # Uncomment the line below if you're not using ActiveRecord
  # config.use_active_record = false

  # Automatically infer spec types based on file location
  # For example, tests in `spec/controllers` will be treated as `type: :controller`
  config.infer_spec_type_from_file_location!

  # Filter Rails gems from backtraces for cleaner test output
  config.filter_rails_from_backtrace!

  # You can also filter other gem backtraces:
  # config.filter_gems_from_backtrace("gem_name")
end
