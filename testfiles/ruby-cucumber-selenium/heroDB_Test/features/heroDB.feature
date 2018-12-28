@selenium

Feature: Hero DB Example

	Background:
		Given site is opened at the address
	
	Scenario: Enter The Flash in the DB
		Given the user is on the Hero DB Test page
		When I enter the username "The Flash"
        And I enter the full name "Barry Allen"
        And I enter the location "Central City"
        And I enter the species "Meta-Human"
        And I enter the age "32"
        And I select the gender "Male"
        Then I click the "Add User" button
        And I verify The Flash is displayed in the User List
        
  	Scenario: Display The Flash User Info
		Given the user is on the Hero DB Test page
		And I verify The Flash is displayed in the User List 
        When I click the UserName The Flash
        Then I verify The Flash User Info is displayed
        
  	Scenario: Edit The Flash User Info
		Given the user is on the Hero DB Test page
		And I verify The Flash is displayed in the User List 
        When I click the The Flash edit link
        And I edit the full name to "Jesse Chambers"
        And I edit the username to "Jesse Quick"
        And I edit the age to "23"
        And I edit the gender to "Female"
        Then I click the "Confirm Changes" button
        And I verify Jesse Quick is displayed in the User List
        When I click the UserName Jesse Quick
        Then I verify Jesse Quick User Info is displayed
        
  	Scenario: Delete Jesse Quick User Info
		Given the user is on the Hero DB Test page
        And I verify Jesse Quick is displayed in the User List
        When I click the Jesse Quick delete link
        When I confirm the user deletion
        Then the user Jesse Quick is no longer displayed in the User List