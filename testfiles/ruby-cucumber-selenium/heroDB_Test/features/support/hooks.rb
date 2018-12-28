require 'selenium-webdriver'

if @env_browser == 'chrome'
  Before ('@selenium') do
    @browser = Selenium::WebDriver.for :chrome
   # @browser.manage.timeouts.implicit_wait = 10
  end
elsif @env_browser == 'firefox'
  Before ('@selenium') do
    @browser = Selenium::WebDriver.for :firefox
    #@browser.manage.timeouts.implicit_wait = 10
  end
end

After ('@selenium') do |scenario|
  @browser.close
  @browser.quit
end