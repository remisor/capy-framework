@user @suite @javascript
Feature: Valid Login credentials

	        @javascript
			Scenario: As a user , I should be able to login with the correct credentials.
				Given I am testing Account Features on Fanxchange
				Then  Once the page is loaded
				Then  I should see Tickets to any live event in one search
				And   I login as a Seller
				Then  I should see Seller
			@javascript
			Scenario: As a user , I should be able to see and access the menu options 
				Given I am testing Account Features on Fanxchange
				Then  Once the page is loaded
				Then  I should see Tickets to any live event in one search
				And   I login as a Seller
				And   I should see Seller
				Then  I go to user drop down menu
				And   I should see EVENTS TO ATTEND
				Then  I should see My Orders
				Then  I follow My Orders
				Then  I should see My Orders
				And   I should see Order Number
				And   I should see Event
				And   I should see Event Date
				
				Then  I go to user drop down menu
            	And   I should see SELLING TICKETS
				Then  I should see My Tickets for Sale
				And   I follow My Tickets for Sale
            	Then  I should see My Tickets for Sale
       	
            	Then  I go to user drop down menu
				Then  I should see My Tickets Sold
				And   I follow My Tickets Sold
				Then  I should see My Tickets Sold
	
				Then  I go to user drop down menu
				Then  I should see My Expired Tickets
				And   I follow My Expired Tickets
				Then  I should see My Expired Tickets
                                                      
				Then  I go to user drop down menu
				Then  I should see Payment
				And   I follow Payment
				And   I should see Payment

				Then  I go to user drop down menu
				And   I should see MY PROFILE
				Then  I should see My Info
				And   I follow My Info
				And   I should see My Info

				Then  I go to user drop down menu
				Then  I should see My Seller's Info
				And   I follow My Seller's Info
				Then  I should see My Seller's Info
				Then  I go to user drop down menu
				And   I should see Log Out
				And   I follow Log Out
		@javascript @invalid
 		Scenario: Create new account with invalid credentials
			Given I am testing Account Features on Fanxchange
			Then  Once the page is loaded
			Then  I should see Sign In
			Then  I follow Sign In
			Then  I should see Create a new account
			Then  I follow Create a new account
			And   I fill name with Wrong Credentials
			And   I fill password with test123
			Then  I try to Signup
			Then  I should see Please enter an email address.
        @javascript @valid
	    Scenario: Create new account with valid credentials
			Given I am testing Account Features on Fanxchange
			Then  Once the page is loaded
			Then  I should see Sign In
			Then  I follow Sign In
			Then  I should see Create a new account
			Then  I follow Create a new account
			And   I fill name with Right Credentials
			And   I fill email with something1234@something.com
			And   I fill password with Metest123
			And   I Sign up
			Then  I should be logged in with the newly created account
         @javascript @guest
		 Scenario: Guest Checkout
			Given I am testing Account Features on Fanxchange
			Then  Once the page is loaded
			Then  I follow NBA
			Then  I follow Toronto Raptors
			Then  Once the page is loaded
			Then  I should see Toronto Raptors tickets
			Then  I press Home
			Then  I should see Toronto Raptors vs.
			Then  I go to the fifth displayed event
			Then  Once the page is loaded
			Then  I select the first ticket from the list
			Then  I should see Guest Checkout
        @javascript @testnew
		Scenario: Verify My orders page displays correctly for newly created account
			Given I am testing Account Features on Fanxchange
			Then  Once the page is loaded
			Then  I should see Sign In
			Then  I follow Sign In
			Then  I should see Create a new account
			Then  I follow Create a new account
			And   I fill name with Right Credentials
			And   I fill email with something123456@something.net
			And   I fill password with Metest123
			And   I Sign up
			Then  I should see Hi Right
			Then  I go to user drop down menu 
			And   I follow My Orders 
			Then  I should see My Orders
			Then  I go to user drop down menu
    		Then  I should see My Orders
    		Then  I should see Selling Tickets
    		Then  I should see My Tickets for Sale
        	Then  I should see My Tickets Sold
    		Then  I should see My Expired Tickets
    		Then  I should see Payment
    		Then  I should see My Profile
    		Then  I should see My Info
    		Then  I should see My Seller's Info       
    	@javascript @delete
    	Scenario: Delete Payload for created test accounts
    		Given I am testing Account Features on Fanxchange
    		Then  Once the page is loaded
    		Then  I login as a Broker
			And   I should see Remus
			Then  I go to user drop down menu
			And   I follow Admin Panel
			And   I press admin tool Site Settings
			Then  I should see Users Managing
			And   I follow Users Managing
			Then  I search for previously created user accounts
			Then  I retrieve the found accounts
			Then  I delete the first test account
			Then  I follow Users Managing
			Then  I search for previously created user accounts
			Then  I retrieve the found accounts
			Then  I delete the second test account
