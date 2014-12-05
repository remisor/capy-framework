Given(/^I am testing Hard Ticket Features on Fanxchange$/) do
  visit "https://devteam:xkc2nXV8@staging.www.fanxchange.com"
end

Given(/^I login with Fanxchange Confirmation E\-mail Address$/) do
  visit "http://www.gmail.com"
  sleep(5)
  page.fill_in('Email',:with => 'fanxchangedev@gmail.com')
  page.fill_in('Passwd',:with => 'f@nxchang3')
  page.find(:css,'#signIn').trigger('click')
  sleep(5)
end

Then(/^I should see Toronto Blue Jays tickets$/) do
  page.should have_content 'Toronto Blue Jays tickets'
end

Then(/^I should see Toronto Blue Jays vs\.$/) do
  page.should have_content 'Toronto Blue Jays vs'
end

Then(/^I check event for which i'm selling the tickets$/) do
  div=page.all(:css,'.sidebar-container')[0]
  andro = div.find(:css,'h1').text
  andro1 = div.find(:css,'h2').text
  andro2 = div.find(:css,'h3').text
  andro3 = div.all(:css,'p')[0].text
  puts andro
  puts "#{andro1} #{andro2}"
  puts andro3
end

Then(/^I use Ship hard tickets by FedEx$/) do
  page.choose('ticket_deails_hardticket')
end

Then(/^I should be on My Tickets Sold page$/) do
  page.should have_content 'My Tickets Sold'
end

Then(/^I set the airbil date to (\d+)\-(\d+)\-(\d+)$/) do |arg1, arg2, arg3|
  page.fill_in('waybill_create',:with => "#{arg1.to_s}#{arg2.to_s}#{arg3.to_s}")
  sleep(2)
end

Then(/^I Create the Airbill$/) do
  page.click_button('Create Airbill')
end

Then(/^I should see the Tracking number of the order$/) do
  sleep(10)
  puts page.all(:span,'.font-14')[0].text
  save_screenshot(''[1600,1200])
end

Then(/^I Print the Airbill$/) do
  page.click_button('Print Airbill')
end
#@emailconfirm
Then(/^I should see My Inbox$/) do
  page.should have_content 'Inbox'
end

Then(/^I check for order confirmation e\-mail$/) do
  page.should have_content 'Congratulations! Your Order Has Been Confirmed.'
end

Then(/^I check for tickets sent confirmation e\-mail$/) do
  page.should have_content 'Congratulations! Your Tickets Have Been Sent.'
end