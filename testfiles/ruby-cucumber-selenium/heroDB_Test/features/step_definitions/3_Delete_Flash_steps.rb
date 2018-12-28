When /^I click the Jesse Quick delete link$/ do
  @browser.find_element(:css, '.linkdeleteuser').click
end

When /^I confirm the user deletion$/ do
    sleep 1
    @browser.switch_to.alert.accept
end

When /^the user Jesse Quick is no longer displayed in the User List$/ do
    sleep 1
    exist = @browser.find_element(:css, '#userList > table > tbody').displayed?
    expect(exist).to be false
end