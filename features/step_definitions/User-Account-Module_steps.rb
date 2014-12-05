Given(/^I am testing Account Features on Fanxchange$/) do
  visit "https://devteam:xkc2nXV8@staging.www.fanxchange.com"
end

Then(/^I should see Seller$/) do
  page.should have_content 'Seller'
end

Then(/^I should see EVENTS TO ATTEND$/) do
  page.should have_content 'EVENTS TO ATTEND'
end

Then(/^I should see My Orders$/) do
  page.should have_content 'My Orders'
end

Then(/^I follow My Orders$/) do
  page.click_link('My Orders')
end

Then(/^I should see Order Number$/) do
  page.should have_content 'Order #'
end

Then(/^I should see Event$/) do
  page.should have_content 'Event'
end

Then(/^I should see Event Date$/) do
  page.should have_content 'Event'
end

Then(/^I should see SELLING TICKETS$/) do
  page.should have_content "SELLING TICKETS"
end

Then(/^I should see My Tickets for Sale$/) do
  page.should have_content 'My Tickets for Sale'
end

Then(/^I follow My Tickets for Sale$/) do
  page.find(:css,'.myfanx-menu').click_link('My Tickets for Sale')
end

Then(/^I should see My Expired Tickets$/) do
  page.should have_content 'My Expired Tickets'
end

Then(/^I follow My Expired Tickets$/) do
  page.find(:css,'.myfanx-menu').click_link('My Expired Tickets')
end

Then(/^I should see Payment$/) do
  page.should have_content 'Payment'
end

Then(/^I follow Payment$/) do
  page.find(:css,'.myfanx-menu').click_link('Payment')
end

Then(/^I should see MY PROFILE$/) do
  page.should have_content 'MY PROFILE'
end

Then(/^I should see My Info$/) do
  page.should have_content 'My Info'
end

Then(/^I follow My Info$/) do
  page.find(:css,'.myfanx-menu').click_link('My info')
end

Then(/^I should see My Seller's Info$/) do
  page.should have_content "My Seller's Info"
end

Then(/^I follow My Seller's Info$/) do
  page.find(:css,'.myfanx-menu').click_link("My Seller's Info")
end

Then(/^I should see Log Out$/) do
  page.should have_content "Log Out"
end

Then(/^I follow Log Out$/) do
  page.find(:css,'.myfanx-menu').click_link("Log Out")
end

Then(/^I should see Sign In$/) do
  sleep(3)
  page.should have_content 'Sign In'
end

Then(/^I follow Sign In$/) do
  page.find(:css,'.btn-auth-navbar',:visible =>true).trigger('click')
end

Then(/^I should see Create a new account$/) do
  page.should have_content 'Create a new account'
end

Then(/^I follow Create a new account$/) do
  page.find(:css,'.authModalregisterLink').trigger('click')
  #page.click_link('Create a new account')
end

Then(/^I fill name with Wrong Credentials$/) do
  page.find(:css,'.auth-full-name').set 'Wrong Credentials'
end

Then(/^I fill password with test(\d+)$/) do |arg1|
  page.find(:css,'.auth-register-password').set "test#{arg1}"
end

Then(/^I try to Signup$/) do
  sleep(2)
  page.click_button('Create')
  sleep(3)
end

Then(/^I should see Please enter an email address\.$/) do
  page.should have_content 'Please enter email address.'
end

Then(/^I fill name with Right Credentials$/) do
  page.find(:css,'.auth-full-name').set 'Right Credentials'
end

Then(/^I fill email with something(\d+)@something\.com$/) do |arg1|
  page.find(:css,'.auth-email-address').set 'something1234@something.com'
end

Then(/^I fill password with Metest(\d+)$/) do |arg1|
  page.find(:css,'.auth-register-password').set "Metest#{arg1}"
end

Then(/^I Sign up$/) do
  sleep(2)
  page.click_button('Create')
  sleep(8)
  save_screenshot(''[1600,1200])
end

Then(/^I should be logged in with the newly created account$/) do
  page.should have_content 'Right'
end

Then(/^I should see Guest Checkout$/) do
  page.should have_content 'Guest Checkout'
end

Then(/^I fill email with something(\d+)@something\.net$/) do |arg1|
  page.find(:css,'.auth-email-address').set 'something1234@something.net'
end

Then(/^I should see Hi Right$/) do
  page.should have_content 'Right'
end

Then(/^I should see Selling Tickets$/) do
  page.should have_content 'SELLING TICKETS'
end

Then(/^I should see My Profile$/) do
  page.should have_content 'MY PROFILE'
end

Then(/^I login as a Broker$/) do
  page.find(:css,'.btn-auth-navbar',:visible =>true).trigger('click')
  page.find(:css,'.fanx_login_modal_email').set 'remus.copil@voicemailtel.com'
  page.find(:css,'#passwordL').set "dontletmedown123"
  page.find(:css,'#fanx_login_modal').trigger('click')
  sleep(8) #wait to sign in
end

Then(/^I should see Remus$/) do
  page.should have_content 'Remus'
end

Then(/^I follow Admin Panel$/) do
  page.click_link('Admin Panel')
end

Then(/^I press admin tool Site Settings$/) do
  page.all(:css,'.ajax-link')[0].trigger('click')
end

Then(/^I should see Users Managing$/) do
  page.should have_content 'Users Managing'
end

Then(/^I follow Users Managing$/) do
  page.click_link('Users Managing')
end

Then(/^I search for previously created user accounts$/) do
  page.find(:css,'#site_settings_filter > label > input[type="text"]').set 'Credentials'
  page.should have_content 'Right'
end

Then(/^I retrieve the found accounts$/) do
  puts page.find(:css,'#change_results').text
end
# #change_results > tr.odd > td:nth-child(6)
Then(/^I delete the first test account$/) do
  page.find(:css,'#change_results > tr.odd > td:nth-child(6) > a').trigger('click')
  sleep(5)
  page.click_button('Delete user')
  sleep(3)
end

Then(/^I delete the second test account$/) do
  page.find(:css,'#change_results > tr.odd > td:nth-child(6) > a').trigger('click')
  sleep(5)
  page.click_button('Delete user')
  sleep(3)
end

Then(/^I select the first ticket from the list$/) do
  page.driver.header "Authorization","Basic ZGV2dGVhbTp4a2MyblhWOA==" #server needed authorization again ...
  page.find(:xpath,'//*[@id="InventoryContainer"]/div[2]/div/table/tbody/tr[1]/td/div/div[2]/input').trigger('click')
  sleep(3)
end