@etickets @javascript
Feature: E-Tickets
			#e-ticket upload not working in the test
			@javascript @selletickets			
			Scenario: Sell E-Tickets
					Given I am testing E-Tickets Features on Fanxchange
					Then  Once the page is loaded
					Given I login as a Seller
					Then  I should be logged in and see Hi Seller
					Then  I follow NBA
					Then  I follow Toronto Raptors
					Then  I press Home
					Then  I select the fifth event to sell tickets for
					Then  I use Yes, I have already the tickets.
					Then  I use I’ll deliver the tickets electronically. (PDF format)
					Then  I use General Admission
					Then  I set ticket quantity for 6
					Then  I use None, sell all my tickets together.
					And   I GO TO STEP Three-authenticate
					Then  I follow NBA
					Then  I follow Toronto Raptors
					Then  I press Home
					Then  I select the fifth event to sell tickets for
					And   I should see A few details we'll need to know.
					Then  I use Yes, I have already the tickets.
					Then  I use I’ll deliver the tickets electronically. (PDF format)
					Then  I use General Admission
					Then  I set ticket quantity for 6
					Then  I use None, sell all my tickets together.
					And   I GO TO STEP Three
					Then  Once the page is loaded
					And   I should see It's your call. Set your rates!
		 	        Then  I set the price tickets I want to sell to 1.11
					Then  I set the end date of the sale to 09-01-2014
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

			@javascript @buy
			Scenario: Buy
					Given I am testing E-Tickets Features on Fanxchange
					Then  Once the page is loaded
					Given I login as a Buyer
					Then  I should be logged in and see Hi Buyer
					Then  I follow NBA
					Then  I follow Toronto Raptors
					Then  I press Home
					Then  I should see Toronto Raptors tickets
					Then  I should see Toronto Raptors vs.
					Then  I select the fifth event to buy tickets for
					Then  Once the page is loaded
					Then  I check E-Tickets filter
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
				    Then  I should see my order number ID
				    Then  I save order number ID for use with admin confirmation
            
		    @javascript @confirmadmin
			Scenario: Confirm E-Ticket On The Admin Portal
		    		Given I am testing Confirm Features on Admin Portal
		    		Then  I should be logged in on the Admin Portal
		    		Then  I follow Orders
		    		Then  I search for the last order placed by buyer-wat
		    		Then  I should see E-Ticket Order Pending!
		    		And   I Approve the Order
		    		And   I should see Order has been approved and sent to the seller for confirmation
           
		    @javascript @confirmseller
		    Scenario: Confirm E-Ticket from Seller Account and Upload E-Ticket
		            Given I am testing E-Tickets Features on Fanxchange
					Then  Once the page is loaded
					Given I login as a Seller
					Then  I should be logged in and see Hi Seller
		    		Then  I go to user drop down menu
			        Then  I should see My Tickets Sold
			        And   I follow My Tickets Sold
			        Then  I press open details for the last ticket sold
			        And   I should see two options: Cancel and Confirm
			        Then  I Confirm the ticket
			        Then  Once the page is loaded
			        Then  My order should be confirmed
			        Then  I should see Select Your E-Tickets for upload

			@javascript @morethanmax        
			Scenario: Upload more e-tickets than the maxium number allowed
					Given I am testing E-Tickets Features on Fanxchange
					Then  Once the page is loaded
					Given I login as a Seller
					Then  I should be logged in and see Hi Seller
					Then  I go to user drop down menu
                    Then  I should see My Tickets Sold
                    And   I follow My Tickets Sold
                    Then  I press open details for the last ticket sold     
                    Then  I upload e-ticket
                    Then  I upload e-ticket
                    Then  I upload e-ticket
                    Then  I upload e-ticket
                    Then  I upload e-ticket
                    Then  I upload e-ticket
                    Then  I upload e-ticket
                    Then  I upload
                    Then  I should see The maximum number of tickets you can upload
			
			@javascript @uploadmodule
            Scenario: Test Upload Module
                    Given I am testing E-Tickets Features on Fanxchange
					Then  Once the page is loaded
					Given I login as a Seller
					
					Then  I should be logged in and see Hi Seller
					Then  I go to user drop down menu
                    Then  I should see My Tickets Sold
                    And   I follow My Tickets Sold
                    Then  I press open details for the last ticket sold     
                    Then  I upload e-ticket
                    Then  I upload
		            Then  I should see E-Ticket Link
			
		    