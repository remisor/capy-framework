@admin @javascript
Feature: Admin Panel

		@javascript @orderhistorytable
		Scenario: Order History table
			Given I navigate to "http://staging.admin.fanxchange.com/"
			And   I fill in "email_address" with "remus.copil@voicemailtel.com"
			And   I fill in "password" with "dontletmedown123"
			Then  I press "Submit"
			Then  I should see "Logged in (Fanx Staff Level)"
			Then  I follow "Orders"
			Then  I should see "Orders"
			Then  I press on first order
			Then  I should see "Order History"
			Then  I should see "Date Added" 
			Then  I should see "Customer Notified"
   			Then  I should see "Seller Notified"
			Then  I should see "Status"
			Then  I should see "Comments"
			Then  I should see "Completed By"

		@javascript @validatestatus
		Scenario: Validate status on admin
			Given I am on "http://staging.admin.fanxchange.com/"
			And   I fill in "email_address" with "remus.copil@voicemailtel.com"
			And   I fill in "password" with "dontletmedown123"
			Then  I press "Submit" button with xpath "//*[@id='loginpanel']/table/tbody/tr[3]/td/input"
			Then  I accept the modal
			Then  I should see "Logged in (Fanx Staff Level)"
			Then  I follow "Orders"
			Then  I should see "Pending Eticket"

		@javascript @validateorder
	    Scenario: Validate status on admin order details page
			Given I am on "http://staging.admin.fanxchange.com/"
			And   I fill in "email_address" with "remus.copil@voicemailtel.com"
			And   I fill in "password" with "dontletmedown123"
			Then  I press submit
			Then  I should see "Logged in (Fanx Admin Level)"
			Then  I follow "Orders"
			Then  I click on the element with css "#defaultSelected"
			Then  I should see "Apporve Order"
			And   I should see "Cancel Order"

		@javascript @confirmsalesorder
		Scenario: Confirm Sales Report
			Given I am on "http://staging.admin.fanxchange.com/"
			And   I fill in "email_address" with "remus.copil@voicemailtel.com"
			And   I fill in "password" with "dontletmedown123"
			Then  I press "Submit" button with xpath "//*[@id='loginpanel']/table/tbody/tr[3]/td/input"
			Then  I confirm the popup
			Then  I should see "Logged in (Fanx Admin Level)"
			Then  I follow "Most Purchased Events"
			Then  I select "purchased_events" from "type"
			And   I select "1" from "smonth"
			And   I select "1" from "sday"
			And   I select "2014" from "syear"
			And   I select "5" from "emonth"
			And   I select "15" from "eday"
			And   I select "2014" from "eyear"
			And   I select "Screen" from "output"
			Then  I press "Get Report" button with xpath "//*[@id='midWrapper']/table/tbody/tr/td[2]/table/tbody/tr[2]/td/table/tbody/tr[6]/td[2]/input"
			Then  I should see "Records found"
			Then  I should see how many records are found