@hardtickets @javascript
Feature: Sells Hard Tickets / Buys Hard Tickets / Confirms Hard Tickets / Checks for confirmations e-mails / Creates and Prints Airbill for sold tickets
				
				#MLB season ended so I used NBA Toronto Raptors team for test
				#email verification doesn't worked together with this feature so i put that separately
				# sometimes appears the error below.... and the html screenshot has 0 byte size but the html image shows step 5- if it happens the rest of the feature 
				#fails as well
				# Then I Confirm                                                        # features/step_definitions/E-Ticket-Module_steps.rb:107
      			#Unable to load URL: https://staging.www.fanxchange.com/ticketreview because of error loading https://staging.www.fanxchange.com/ticketreview: Unknown 
      			#error (#Capybara::Webkit::InvalidResponseError)

				@javascript @sellhard
				Scenario: Sell Hard Tickets
					Given I am testing Hard Ticket Features on Fanxchange
					Then  Once the page is loaded
					Then  I login as a Seller
					Then  I should be logged in and see Hi Seller
					Then  I follow NBA
					Then  I follow Toronto Raptors
					Then  I should see Toronto Raptors tickets
					Then  I press Home
					Then  I should see Toronto Raptors vs.
					Then  I select the fifth event to sell tickets for
					Then  Once the page is loaded
					Then  I check event for which i'm selling the tickets
					Then  I should see A few details we'll need to know.
					Then  I use Yes, I have already the tickets.
					Then  I use Ship hard tickets by FedEx 
					Then  I use General Admission 
					Then  I set ticket quantity for 6
					Then  I use None, sell all my tickets together.
					And   I GO TO STEP Three
					Then  Once the page is loaded
					Then  I should see It's your call. Set your rates!
					Then  I set the price tickets I want to sell to 1.11
					Then  I set the end date of the sale to 12-15-2014
					Then  I GO TO STEP Four
					Then  Once the page is loaded
					Then  I should see And now, for the best part. Tell us how to pay you!
					Then  I use security code: 123
					Then  I GO TO STEP Five
					Then  I Confirm 
					And   I LIST TICKETS
					Then  Once the page is loaded
					Then  I should see CONGRATULATIONS! Your ticket(s) is/are listed!
					Then  I check my payout
			
			@javascript @buyhard
			Scenario: Buy Hard Tickets
					Given I am testing Hard Ticket Features on Fanxchange
					Then  Once the page is loaded
					And   I login as a Buyer
					Then  I should be logged in and see Hi Buyer
					Then  I follow NBA
					Then  I follow Toronto Raptors
					Then  Once the page is loaded
					Then  I should see Toronto Raptors tickets
					Then  I press Home
					Then  I should see Toronto Raptors vs.
					Then  I select the fifth event to buy tickets for
					Then  Once the page is loaded
					Then  I select the first ticket in the list
					Then  I check event for which i'm buying the tickets
					Then  Once the page is loaded
					Then  I should see Step 1 - Order Form
					Then  I use card number: 4111111111111111
				    Then  I user name on card: Remus Copil
				    Then  I use expiry month: November
				    Then  I use expiry year: 2022
 				    Then  I use security code: 123
 				    Then  I Proceed to checkout
					Then  Once the page is loaded
					And   I should see Step 2 - Order Confirmation
					Then  I Agree to the terms and conditions
				    And   I ORDER TICKETS
				    Then  Once the page is loaded
				    Then  I should see Thank you for placing your order with FanXchange.
			
			@javascript @confirmhard
			Scenario: Confirm Order
					Given I am testing Hard Ticket Features on Fanxchange
					Then  Once the page is loaded
					Then  I login as a Seller
					Then  I should be logged in and see Hi Seller
					Then  I go to user drop down menu
			        Then  I should see My Tickets Sold
			        And   I follow My Tickets Sold
			        Then  I should be on My Tickets Sold page
			        Then  I press open details for the last ticket sold
			        And   I should see two options: Cancel and Confirm
			        Then  I Confirm the ticket
			        Then  Once the page is loaded
			        Then  My order should be confirmed
			
			@javascript @airbill      
			Scenario: Create and Print Airbill
					Given I am testing Hard Ticket Features on Fanxchange
					Then  Once the page is loaded
					Then  I login as a Seller
					Then  I should be logged in and see Hi Seller
			        Then  I go to user drop down menu
			        Then  I should see My Tickets Sold
			        And   I follow My Tickets Sold
			        Then  Once the page is loaded
			        Then  I should be on My Tickets Sold page
			        Then  I press open details for the last ticket sold
			        Then  I set the airbil date to 12-10-2014			   
			        Then  I Create the Airbill
			        And   I should see the Tracking number of the order
			        Then  I Print the Airbill
			        