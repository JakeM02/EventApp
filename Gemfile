ruby "3.3.5"
source "https://rubygems.org"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 8.0.1"
# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"
# Use postgresql as the database for Active Record
gem "pg", "~> 1.5.9"
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"
# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"
# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"
# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"
# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"
gem "bootstrap", "~> 5.3.0"
gem "sassc-rails"
gem "jquery-rails"
gem "bcrypt", "~> 3.1"
gem "rails-controller-testing"






# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]
# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false


group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman"
  gem "rubocop-rails-omakase"
  gem "bundler-audit"
  gem "ruby_audit"
  gem "rubocop"
  gem "rspec-rails", "~> 7.1.0"
  gem "capybara" # For system/integration tests
  gem "selenium-webdriver" # For browser-based tests
end


group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"
end

group :test do
  gem "capybara" # For system/integration tests
  gem "selenium-webdriver" # For browser-based tests
  gem "factory_bot_rails" # For test data creation
  gem "faker" # To generate test data
  gem "rspec-rails", "~> 7.1.0"
end
