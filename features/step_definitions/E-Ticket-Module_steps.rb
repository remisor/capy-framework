#!/bin/env ruby
# encoding: utf-8

Given(/^I am testing E\-Tickets Features on Fanxchange$/) do
  visit "https://devteam:xkc2nXV8@staging.www.fanxchange.com"
end

Given(/^I login as a Seller$/) do
  page.find(:css, '#closepls > div.container.hidden-phone > div > div > div > div > a.btn.btn-auth-navbar').trigger('click')
  page.should have_css('#authenticationModal')
  page.find(:xpath, '//*[@id="authenticationModal"]/div/div/div[1]/div[1]/div[2]/form[1]/input[1]').set('wattest3@gmail.com')
  page.fill_in('passwordL', :with => 'testme2012')# will try with adding \n to the end of the password
  page.find(:css, '.fanx_login_modal_login').trigger('click')
  sleep(8) #wait to log in
end

Then(/^I should be logged in and see Hi Seller$/) do
  page.should have_content 'Seller'
end

#@selletickets
Then(/^I follow MLB$/) do
  click_link('MLB')
end

Then(/^I follow Toronto Blue Jays$/) do
  page.find(:xpath,'//*[@id="closepls"]/div[1]/div/div/div/ul/li[2]/ul/li[27]/a').trigger('click')
end

Then(/^I select the fifth event to sell tickets for$/) do 
  sleep(5)
  page.find(:xpath,'//*[@id="teamSchedule"]/div[1]/div/div[5]/div[2]/div[1]/a').trigger('click')
  sleep(5)
  puts url
end

Then(/^I should see A few details we'll need to know\.$/) do
  page.should have_content "A few details we'll need to know." 
end

Then(/^I use Yes, I have already the tickets\.$/) do
  choose('have_ticket_radio_yes')
end

Then(/^I use I’ll deliver the tickets electronically\. \(PDF format\)$/) do
  choose('ticket_deails_eticket')
end

Then(/^I use General Admission$/) do
  choose('general_admission')
end

Then(/^I set ticket quantity for (\d+)$/) do |arg1|
  page.find(:css,'#quantity_details').set(arg1)
  sleep(2)
end

Then(/^I use None, sell all my tickets together\.$/) do
  page.find(:xpath,'//*[@id="collapseThree"]/div/div[3]/div/label[3]').trigger('click')
  sleep(2)
  
end

Then(/^I GO TO STEP Three-authenticate$/) do
  # set the header for authentication
  page.driver.header "Authorization","Basic ZGV2dGVhbTp4a2MyblhWOA=="
  page.find(:xpath,'//*[@id="ticket_details_form"]/div[2]/div/div/input').trigger('click')
  sleep(5)
  puts "Authentication success"
end

Then(/^I GO TO STEP Three$/) do
  page.find(:xpath,'//*[@id="ticket_details_form"]/div[2]/div/div/input').trigger('click')
end


Then(/^I should see It's your call\. Set your rates!$/) do
  page.should have_content "It's your call. Set your rates!"
end

Then(/^I set the price tickets I want to sell to (\d+)\.(\d+)$/) do |arg1, arg2|
  page.find(:css, '.selling_price').set '1.11'
end

Then(/^I set the end date of the sale to (\d+)\-(\d+)\-(\d+)$/) do |arg1, arg2, arg3|
  page.find(:css, '.sale_end_date').set "#{arg1.to_s}#{arg2.to_s}#{arg3.to_s}"
end

Then(/^I GO TO STEP Four$/) do
  sleep(3)
  page.find(:css,'#submit_form').trigger('click')
  sleep(2)
end

Then(/^I should see And now, for the best part\. Tell us how to pay you!$/) do
  page.should have_content "And now, for the best part. Tell us how to pay you!"
end

Then(/^I use security code: (\d+)$/) do |arg1|
  page.fill_in('seccode', :with => arg1 ) 
end

Then(/^I GO TO STEP Five$/) do
  save_screenshot('' [1600,1200])
  page.find(:css,'#next').trigger('click')
end

Then(/^I Confirm$/) do
  sleep(10) #wait for page to load
  page.find(:css,'.checkbox').trigger('click') #click on the label of the user agreement checkbox
  sleep(3)
end

Then(/^I LIST TICKETS$/) do
  page.find(:css,'#go_to_confirmation').trigger('click')
end

Then(/^I should see CONGRATULATIONS! Your ticket\(s\) is\/are listed!$/) do
  page.should have_content "CONGRATULATIONS! Your ticket(s) is/are listed!"
end

Then(/^I check my payout$/) do
  puts page.find(:css,'body > div.container > div:nth-child(3) > div > ul > li').text
  save_screenshot('' [1600,1200])
end

#@buy

Given(/^I login as a Buyer$/) do
  page.find(:css, '#closepls > div.container.hidden-phone > div > div > div > div > a.btn.btn-auth-navbar').trigger('click')
  page.should have_css('#authenticationModal')
  page.find(:xpath, '//*[@id="authenticationModal"]/div/div/div[1]/div[1]/div[2]/form[1]/input[1]').set('wattest4@gmail.com')
  page.fill_in('passwordL', :with => 'testme2012')
  page.find(:css, '.fanx_login_modal_login').trigger('click')
  sleep(8) #wait to log in
end

Then(/^I should be logged in and see Hi Buyer$/) do
  page.should have_content 'Buyer'
end


Then(/^I should see Toronto Raptors vs\.$/) do
  page.should have_content "Toronto Raptors vs"
end

Then(/^I select the fifth event to buy tickets for$/) do
  page.find(:xpath,'//*[@id="teamSchedule"]/div[1]/div/div[5]/div[1]/div[2]/table/tbody/tr/td/a').trigger('click')
end

Then(/^I check E\-Tickets filter$/) do
  sleep(2)
  page.find(:css,'#forEticket > label').trigger('click')
end

Then(/^I select the first ticket in the list$/) do
  page.find(:xpath,'//*[@id="InventoryContainer"]/div[2]/div/table/tbody/tr[1]/td/div/div[2]/input').trigger('click')
  sleep(3)
  save_screenshot('' [1600,2000])
end

Then(/^I check event for which i'm buying the tickets$/) do
  puts page.find(:css,'#checkoutForm > div.span9.contentid > h1').text
end

Then(/^I should see Step (\d+) \- Order Form$/) do |arg1|
  page.should have_content 'Step '+arg1.to_s+' - Order Form'
end

Then(/^I use card number: (\d+)$/) do |arg1|
  page.find(:css,'#cardnumber').set arg1
end

Then(/^I user name on card: Remus Copil$/) do
  page.find(:css,'#nameoncard').set 'Remus Copil'
end

Then(/^I use expiry month: November$/) do
  select('11', :from => 'exp_month')
end

Then(/^I use expiry year: (\d+)$/) do |arg1|
  select(arg1,:from => 'exp_year')
end

Then(/^I Proceed to checkout$/) do
  page.find(:css,'#submitCheckout').trigger('click')
end

Then(/^I should see Step (\d+) \- Order Confirmation$/) do |arg1|
  page.should have_css('body > div.container.checkout-form > div > div.span9.contentid > div > div.step.second.active')
end

Then(/^I Agree to the terms and conditions$/) do
  check('agree')
end

Then(/^I ORDER TICKETS$/) do
  # body > div.container.checkout-form > div > div.span3.margin-top-1 > div > div.wrapper-sticky > div > input
  page.find(:css,'body > div.container.checkout-form > div > div.span3.margin-top-1 > div > div.wrapper-sticky > div > input').trigger('click')
end

Then(/^I should see Thank you for placing your order with FanXchange\.$/) do
 page.should have_content "Thank you for placing your order with FanXchange."
end

Then(/^I should see my order number ID$/) do
  puts page.find(:css,'body > div.container.checkout-form > div > div.span9.contentid > h3').text
end

Then(/^I save order number ID for use with admin confirmation$/) do
  content = page.find(:css,'body > div.container.checkout-form > div > div.span9.contentid > h3').text
  File.open("order-number.txt", "w") {|file| file.puts content}
end

# @confirmadmin

Given(/^I am testing Confirm Features on Admin Portal$/) do
  visit "http://staging.admin.fanxchange.com/"
  page.fill_in('email_address', :with => 'remus.copil@voicemailtel.com')
  page.fill_in('password', :with => 'dontletmedown123')
  page.find(:css, '#loginpanel > table > tbody > tr:nth-child(3) > td > input').trigger('click')
  sleep(8) #wait to log in
end

Then(/^I should be logged in on the Admin Portal$/) do
  page.should have_content 'Logged in'
end

Then(/^I follow Orders$/) do
  page.click_link('Orders')
  sleep(5)
end

Then(/^I search for the last order placed by buyer\-wat$/) do
  file=File.open("order-number.txt","r")
  prevorder= file.read
  poz=prevorder.rindex('#')
  page.fill_in('mask_id', :with => prevorder[poz+1,poz+10]+"\n")#enter
  puts prevorder[poz+1,poz+10]
end

Then(/^I should see E\-Ticket Order Pending!$/) do
  page.should have_content 'E-Ticket Order Pending!'
end

Then(/^I Approve the Order$/) do
  page.find(:css,'#midWrapper > table > tbody > tr > td:nth-child(2) > table > tbody > tr:nth-child(4) > td > table > tbody > tr:nth-child(5) > td > a:nth-child(1)').trigger('click')
  save_screenshot('' [1600,1200])
end

Then(/^I should see Order has been approved and sent to the seller for confirmation$/) do
  page.should have_content 'Order has been approved and sent to the seller for confirmation'
end

# @confirmseller

Then(/^I go to user drop down menu$/) do
  page.find(:css,'#closepls > div.container.hidden-phone > div > div > div > div > div > ul > li > a').trigger('click')
end

Then(/^I should see My Tickets Sold$/) do
  page.should have_content 'My Tickets Sold'
end

Then(/^I follow My Tickets Sold$/) do
  page.find(:css,"#closepls > div.container.hidden-phone > div > div > div > div > div > ul > li > ul > li:nth-child(5) > a").trigger('click')
end

Then(/^I press open details for the last ticket sold$/) do
  # #ticketsold > tbody.event_container.hidden-phone > tr:nth-child(1) > td.ticketsSaleQty.detail-dropdown-button > button
  sleep(3)
  page.find(:css,'#ticketsold > tbody.event_container.hidden-phone > tr:nth-child(1) > td.ticketsSaleQty.detail-dropdown-button > button').trigger('click')
end

Then(/^I should see two options: Cancel and Confirm$/) do
  page.should have_content 'Cancel Sale'
  page.should have_content 'Confirm sale'
end

Then(/^I Confirm the ticket$/) do
  page.find_button('Confirm sale').trigger('click')
  sleep(5)
  save_screenshot(''[1600,1200])
end

Then(/^My order should be confirmed$/) do
  page.should have_content 'Sent to Buyer'
end

Then(/^I should see Select Your E\-Tickets for upload$/) do
  page.should have_content 'Select Your E-Tickets for upload'
end

Then(/^I upload e\-ticket$/) do
  #pending #still not working
  # Failed to click element /html/body/div[1]/div/div[2]/div[@id='ticketsSale']/div/div/table[@id='ticketsold']/tbody[1]/tr[@id='detailsHidden_YJ758']/td/div/div[3]/div[1]/div[@id='px-widget-1']/div[1]/div[@id='px-form-1-input']/form[@id='pxupload1']/div/span/input[@id='tryIt_32554'] because of overlapping element /html at position 0, 0; 
  local_file = '/home/voicemailtel/Cuke/eticket.pdf'
  execute_script('var e=document.getElementsByClassName("fileUpload")[0];
    e.style.top="2100px";
    e.style.zIndex=3000000000;
    e.style.display="block"
    e.style.position="absolute"
    e.innerHTML="!!!"
    var e2 = document.getElementsByClassName("navbar-fixed-top")[0];
    e2.style.top = "10px"
    
    ')
  #/html/body/div[1]/div
  sleep(3)
  page.all(:css,'.fileUpload')[0].set(local_file)
  #page.find(:xpath,'//*[@id="detailsHidden_JJ211"]/td/div/div[3]/div[1]').find(:css,'#tryIt_32430').set local_file
  #@browser.file_field(:id => /tryIt_/).set local_file
  
  sleep(3)
  save_screenshot(''[1600,1200])
end
#upload_32425
Then(/^I upload$/) do
  #pending #still not working 
  page.find_button('Upload').trigger('click')
end

Then(/^I should see The maximum number of tickets you can upload$/) do
  page.should have_content 'he maximum number of tickets you can upload'
end

Then(/^I should see E\-Ticket Link$/) do
  link=page.all(:css,'.download-now').each do |arg|
    puts link.href
  end
end
