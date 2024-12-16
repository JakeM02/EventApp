Capybara.register_driver :selenium_chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--headless') # Runs in headless mode
  options.add_argument('--disable-gpu') # Disables GPU hardware acceleration
  options.add_argument('--no-sandbox') # Disables sandboxing (important for CI environments)
  options.add_argument('--window-size=1280x1024') # Optional: set window size

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.default_driver = :selenium_chrome
