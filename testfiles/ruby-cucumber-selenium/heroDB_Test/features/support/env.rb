require 'rspec'
require 'selenium-webdriver'
require 'pry'

case ENV['BROWSER']
when 'ff'
  @env_browser = "firefox"
when 'chrome'
  @env_browser = "chrome"
else
  @env_browser = "chrome"
end