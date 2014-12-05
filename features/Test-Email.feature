@email @javascript
Feature: Acces order e-mail confirmation on gmail
			@javascript
			Scenario: Acces order e-mail confirmation
					Given I login with Fanxchange Confirmation E-mail Address
					Then  I should see My Inbox
					And   I check for order confirmation e-mail
					And   I check for tickets sent confirmation e-mail
					#separate with different tag because of broken pipe error	