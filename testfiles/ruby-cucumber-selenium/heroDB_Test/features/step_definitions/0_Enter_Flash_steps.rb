Given /^site is opened at the address$/ do
    @browser.get "http://localhost:3000/"
end

Given /^the user is on the Hero DB Test page$/ do
  expect(@browser.current_url).to eq "http://localhost:3000/"
  h1 = @browser.find_element(:css, 'body > h1:nth-child(1)').text
  expect(h1).to eq "Hero DB Test"  
end

When /^I enter the username "(.*?)"$/ do |username|
    username_text = @browser.find_element(:css, '#addUser > fieldset:nth-child(1) > input:nth-child(1)')
    username_text.send_keys username
end

When /^I enter the full name "(.*?)"$/ do |name|
  fullname_text = @browser.find_element(:css, '#addUser > fieldset:nth-child(1) > input:nth-child(4)')
  fullname_text.send_keys name
end

When /^I enter the location "(.*?)"$/ do |location|
  location_text = @browser.find_element(:css, '#addUser > fieldset:nth-child(1) > input:nth-child(7)')
  location_text.send_keys location
end

When /^I enter the species "(.*?)"$/ do |species|
  species_text = @browser.find_element(:css, '#addUser > fieldset:nth-child(1) > input:nth-child(2)')
  species_text.send_keys species
end

When /^I enter the age "(.*?)"$/ do |age|
  age_text = @browser.find_element(:css, '#addUser > fieldset:nth-child(1) > input:nth-child(5)')
  age_text.send_keys age
end

When /^I select the gender "(.*?)"$/ do |gender|
    @browser.find_element(:css, '#addUser > fieldset:nth-child(1) > select:nth-child(8)').click
   #sleep 2
    if gender == "Female"
        @browser.find_element(:css, '#addUser > fieldset:nth-child(1) > select:nth-child(8) > option:nth-child(2)').click
    elsif gender == "Male"
        @browser.find_element(:css, '#addUser > fieldset:nth-child(1) > select:nth-child(8) > option:nth-child(3)').click
    elsif gender == "Prefer Not To Specify"
        @browser.find_element(:css, '#addUser > fieldset:nth-child(1) > select:nth-child(8) > option:nth-child(4)').click
    end
end

Then /^I click the "(.*?)" button$/ do |button|
    if button == "Add User"
        @browser.find_element(:css, '#btnAddUser').click
    elsif button == "Confirm Changes"
        @browser.find_element(:css, '#btnEditUser').click
    end
end

Then /^I click the Add User Reset button$/ do |button|
    @browser.find_element(:css, '#btnAddUserResetFields').click
end

Then /^I click the Edit User Reset button$/ do |button|
    @browser.find_element(:css, '#btnEditUserResetFields').click
end

Then /^I verify The Flash is displayed in the User List$/ do
    sleep 2
    username = @browser.find_element(:css, '#userList > table:nth-child(1) > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(1) > a:nth-child(1)').text
    expect(username).to eq "The Flash"
    
    species = @browser.find_element(:css, '#userList > table:nth-child(1) > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(2)').text
    expect(species).to eq "Meta-Human" 
    
    delete = @browser.find_element(:css, '#userList > table:nth-child(1) > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(3) > a:nth-child(1)').text
    expect(delete).to eq "delete"
    
    edit = @browser.find_element(:css, '#userList > table:nth-child(1) > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(4) > a:nth-child(1)').text
    expect(edit).to eq "edit"
end

Then /^I verify Jesse Quick is displayed in the User List$/ do
    sleep 2
    username = @browser.find_element(:css, '#userList > table:nth-child(1) > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(1) > a:nth-child(1)').text
    expect(username).to eq "Jesse Quick"
    
    species = @browser.find_element(:css, '#userList > table:nth-child(1) > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(2)').text
    expect(species).to eq "Meta-Human" 
    
    delete = @browser.find_element(:css, '#userList > table:nth-child(1) > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(3) > a:nth-child(1)').text
    expect(delete).to eq "delete"
    
    edit = @browser.find_element(:css, '#userList > table:nth-child(1) > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(4) > a:nth-child(1)').text
    expect(edit).to eq "edit"
end
