Given(/^I am testing Event Features on Fanxchange$/) do
  visit "https://devteam:xkc2nXV8@staging.www.fanxchange.com"
end

Then(/^I follow Arizona Cardinals$/) do
  page.find(:xpath, '//*[@id="closepls"]/div[1]/div/div/div/ul/li[1]/ul/li[1]/a').trigger('click')
end

Then(/^I check if perfomer Arizona Cardinals has events$/) do
  puts page.find(:xpath,'//*[@id="tickets"]/span').text
end

Then(/^I go to the first displayed event for Arizona Cardinals$/) do
  page.find(:xpath, '//*[@id="teamSchedule"]/div[1]/div/div[1]/div[1]/div[2]/table/tbody/tr/td/a').trigger('click')
end

Then(/^I should see the Map Container element$/) do
  page.should have_css("#MapContainer", :visible => true)
end

Then(/^I check if perfomer Buffalo Bills has events$/) do
  puts page.find(:xpath,'//*[@id="tickets"]/span').text
end

Then(/^I go to the first displayed event for Buffalo Bills$/) do
  page.find(:xpath, '//*[@id="teamSchedule"]/div[1]/div/div[1]/div[1]/div[2]/table/tbody/tr/td/a').trigger('click')
end

Then(/^I filter tickets on the map container section filter for Lower Level \- Sideline$/) do
  page.find(:xpath, '//*[@id="GroupsContainer"]/div[1]/div[1]/span[2]').trigger('click')
end

Then(/^I should see available tickets for Lower Level \- Sideline$/) do
  puts page.find(:xpath,'//*[@id="InventoryContainer"]/div[2]/div/table/tbody/tr[5]/td/div/div[1]/div[1]/span').text
  all(:css,'.section').each do |arg|
    puts arg.text
  end
  save_screenshot('' [1600,1400])
end

Then(/^I go to the fifth displayed event for Arizona Cardinals$/) do
  page.find(:xpath, '//*[@id="teamSchedule"]/div[1]/div/div[5]/div[1]/div[2]/table/tbody/tr/td/a').trigger('click')
end

Then(/^I go to the fifth displayed event$/) do
  page.find(:xpath, '//*[@id="teamSchedule"]/div[1]/div/div[5]/div[1]/div[2]/table/tbody/tr/td/a').trigger('click')
end


Then(/^I go to the second displayed event for Arizona Cardinals$/) do
  page.find(:xpath, '//*[@id="teamSchedule"]/div[1]/div/div[2]/div[1]/div[2]/table/tbody/tr/td/a').trigger('click')
end
 
Then(/^I should see the E\-Ticket filter$/) do
  page.should have_css('#forEticket > label', :visible => true)
end

Then(/^I check the E\-Ticket filter$/) do
  check('eTicketFilter')
end

Then(/^I should see only E\-Tickets in the ticket list$/) do
  all(:css,'.details').each do |arg|
    arg.should have_content 'E-ticket'
  end
end

Then(/^I select more than (\d+) from the quantity option$/) do |arg1|
  select('3', :from => 'TicketQuantity')
end

Then(/^I should see only tickets that have more than (\d+)\+ available tickets for current event$/) do |arg1|
  page.all(:css,'.selectqty > option:nth-child(1)').each do |arg|
    puts arg.text
  end
end
