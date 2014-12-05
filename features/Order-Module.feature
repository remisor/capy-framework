@order @suite @javascript

Feature: Checks if cupon codes disccounts apply to the general total using codes for:
			
			1. Ammount bigger then the total
			2. 30% Precentage off the grand total
			3. Free shipping discount

			@javascript @biggerdiscount
			Scenario: Discount amount is bigger than the grand total
				Given I am testing Order Features on Fanxchange
				Then  Once the page is loaded
				Then  I should see Tickets to any live event in one search
			    And   I login as a Seller
			    Then  I should be logged in and see Hi Seller
				And   I follow NBA
				Then  I follow Toronto Raptors
				Then  I should see Toront Raptors tickets
				Then  I check if perfomer has events
				Then  I go to the first displayed event
				Then  I check if tickets are available for the current event
				Then  I select the first ticket in the list
				Then  Once the page is loaded
				Then  I should see Step 1 - Order Form
				Then  I should see Enter Member Pass Code
				Then  I check my order total
				Then  I press Enter Member Pass Code
				Then  I use member pass code: test70
				Then  I use card number: 4111111111111111
				Then  I user name on card: Remus Copil
				Then  I use expiry month: November
				Then  I use expiry year: 2022
 				Then  I use security code: 123
				Then  I Proceed to checkout
				Then  Once the page is loaded
				And   I should see Step 2 - Order Confirmation
				And   I check my order total
            
            @javascript @perc30
			Scenario: percentage 30%  
				Given I am testing Order Features on Fanxchange
				Then  Once the page is loaded
				Then  I should see Tickets to any live event in one search
			    And   I login as a Seller
			    Then  I should be logged in and see Hi Seller
				And   I follow NBA
				Then  I follow Toronto Raptors
				Then  I should see Toronto Raptors tickets
				Then  I check if perfomer has events
				Then  I go to the first displayed event
				Then  I check if tickets are available for the current event
				Then  I select the first ticket in the list
				Then  Once the page is loaded
				Then  I should see Step 1 - Order Form
				Then  I should see Enter Member Pass Code
				Then  I check my order total
				Then  I press Enter Member Pass Code
				Then  I use member pass code: perc30
				Then  I use card number: 4111111111111111
				Then  I user name on card: Remus Copil
				Then  I use expiry month: November
				Then  I use expiry year: 2022
 				Then  I use security code: 123
				Then  I Proceed to checkout
				Then  Once the page is loaded
				And   I should see Step 2 - Order Confirmation
				And   I check my order total
			
			@javascript @first
			Scenario: Free shipping discount
				Given I am testing Order Features on Fanxchange
				Then  Once the page is loaded
				Then  I should see Tickets to any live event in one search
			    And   I login as a Seller
			    Then  I should be logged in and see Hi Seller
				And   I follow NBA
				Then  I follow Toronto Raptors
				Then  I should see Toronto Raptors tickets
				Then  I check if perfomer has events
				Then  I go to the first displayed event
				Then  I check if tickets are available for the current event
				Then  I select the first ticket in the list
				Then  Once the page is loaded
				Then  I should see Step 1 - Order Form
				Then  I should see Enter Member Pass Code
				Then  I check my order total
				Then  I press Enter Member Pass Code
				Then  I use member pass code: freeshp
				Then  I use card number: 4111111111111111
				Then  I user name on card: Remus Copil
				Then  I use expiry month: November
				Then  I use expiry year: 2022
 				Then  I use security code: 123
				Then  I Proceed to checkout
				Then  Once the page is loaded
				And   I should see Step 2 - Order Confirmation
				And   I check my order total