When /^I click the UserName The Flash$/ do
  @browser.find_element(:css, '.linkshowuser').click
end

When /^I click the UserName Jesse Quick$/ do
  @browser.find_element(:css, '.linkshowuser').click
end

When /^I verify The Flash User Info is displayed$/ do
  sleep 1
    
    name_text = @browser.find_element(:css, '#userInfoName').text
  expect(name_text).to eq "Barry Allen"
    
  age_text = @browser.find_element(:css, '#userInfoAge').text
  expect(age_text).to eq "32"
    
  gender_text = @browser.find_element(:css, '#userInfoGender').text
  expect(gender_text).to eq "Male"
    
  location_text = @browser.find_element(:css, '#userInfoLocation').text
  expect(location_text).to eq "Central City"
end

When /^I verify Jesse Quick User Info is displayed$/ do
  sleep 1
    
    name_text = @browser.find_element(:css, '#userInfoName').text
  expect(name_text).to eq "Jesse Chambers"
    
  age_text = @browser.find_element(:css, '#userInfoAge').text
  expect(age_text).to eq "23"
    
  gender_text = @browser.find_element(:css, '#userInfoGender').text
  expect(gender_text).to eq "Female"
    
  location_text = @browser.find_element(:css, '#userInfoLocation').text
  expect(location_text).to eq "Central City"
end