When /^I click the The Flash edit link$/ do
  @browser.find_element(:css, '.linkedituser').click
end

When /^I edit the username to "(.*?)"$/ do |username|
  username_text = @browser.find_element(:css, '#editUser > fieldset:nth-child(1) > input:nth-child(3)')
  username_text.clear()
  username_text.send_keys username
end

When /^I edit the full name to "(.*?)"$/ do |name|
  fullname_text = @browser.find_element(:css, '#editUser > fieldset:nth-child(1) > input:nth-child(6)')
  fullname_text.clear()
  fullname_text.send_keys name
end

When /^I edit the location to "(.*?)"$/ do |location|
  location_text = @browser.find_element(:css, '#editUser > fieldset:nth-child(1) > input:nth-child(9)')
  location_text.clear()    
  location_text.send_keys location
end

When /^I edit the species to "(.*?)"$/ do |species|
  species_text = @browser.find_element(:css, '#editUser > fieldset:nth-child(1) > input:nth-child(4)')
  species_text.clear()
  species_text.send_keys species
end

When /^I edit the age to "(.*?)"$/ do |age|
  age_text = @browser.find_element(:css, '#editUser > fieldset:nth-child(1) > input:nth-child(7)')
  age_text.clear()
  age_text.send_keys age
end

When /^I edit the gender to "(.*?)"$/ do |gender|
    @browser.find_element(:css, '#editUser > fieldset:nth-child(1) > select:nth-child(10)').click
   #sleep 2
    if gender == "Female"
        @browser.find_element(:css, '#editUser > fieldset:nth-child(1) > select:nth-child(10) > option:nth-child(2)').click
    elsif gender == "Male"
        @browser.find_element(:css, '#editUser > fieldset:nth-child(1) > select:nth-child(10) > option:nth-child(3)').click
    elsif gender == "Prefer Not To Specify"
        @browser.find_element(:css, '#editUser > fieldset:nth-child(1) > select:nth-child(10) > option:nth-child(4)').click
    end
end