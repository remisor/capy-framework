# Headless env and required gems *
if ENV['headless'] == 'true'
require 'rubygems'
require 'capybara'
require 'capybara/cucumber'
require 'capybara/dsl'
require 'capybara-webkit'
require 'rspec/expectations'
require 'rspec'
require 'mail'
require 'capybara-screenshot/cucumber'
# Capybara Session Configuration *
Capybara::Session.new(:webkit)
#Capybara.page.driver.browser.manage.window.maximize 
Capybara.run_server = false
Capybara.default_wait_time = 30
# Capybara Screenshot Module *

Capybara::Screenshot.prune_strategy = :keep_last_run
Capybara.save_and_open_page_path = "/home/fanxchnge/capy-wat-framework/fanxchange/reports/screens"
# Capybara Ignore SSL errors module *
Capybara.register_driver :webkit do |app|
browser = Capybara::Webkit::Browser.new(Capybara::Webkit::Connection.new).tap do |browser|
browser.ignore_ssl_errors
end
Capybara::Webkit::Driver.new(app, :browser => browser)
end
Capybara.javascript_driver = :webkit
Capybara::Screenshot.webkit_options = { width: 1600, height: 1200 }

# Standard url fetch (implement curl header response in future release) *

def url
 URI.parse(current_url)
end

end
