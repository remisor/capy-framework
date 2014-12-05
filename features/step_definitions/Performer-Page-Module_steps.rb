Given(/^I am testing Perfomer Features on Fanxchange$/) do
  visit "https://devteam:xkc2nXV8@staging.www.fanxchange.com"
end

Then(/^I follow NBA$/) do
  page.find(:css, '#closepls > div.container.hidden-phone > div > div > div > ul > li:nth-child(3) > a').trigger('click')
  #save_screenshot('' [1600,1400])
end
#                  #closepls > div.container.hidden-phone > div > div > div > ul > li.dropdown.multicol3.open > ul > li:nth-child(24) > a
Then(/^I follow Toronto Raptors$/) do
  page.find(:css, '#closepls > div.container.hidden-phone > div > div > div > ul > li.dropdown.multicol3.open > ul').find_link('Toronto Raptors').trigger('click')
  #save_screenshot('' [1600,1400])
end

Then(/^I should see Toronto Raptors tickets$/) do
  page.should have_content 'Toronto Raptors tickets'
end

Then(/^I check if perfomer has events$/) do
  tic= page.all('a#tickets',).each do |arg|
    puts arg.text
  end
end

Then(/^If there are more than (\d+) events, Load More button should be present$/) do |arg1|
  divevents= page.all('div > .list-box').size
  puts "Currently displayed events"
  puts divevents
  if divevents==30
   ldbtn = page.find('#load_more1').value
    puts "Button exists with"
    puts ldbtn
  else
    puts "No more events than 30"
  end
end

Then(/^I follow NFL$/) do
  page.find(:css, '#closepls > div.container.hidden-phone > div > div > div > ul > li:nth-child(1) > a').trigger('click')
  #save_screenshot('' [1600,1400])
end

Then(/^I follow Buffalo Bills$/) do
  page.find(:css, '#closepls > div.container.hidden-phone > div > div > div > ul > li.dropdown.multicol3.open > ul').find_link('Buffalo Bills').trigger('click')
  #save_screenshot('' [1600,1400])
end

Then(/^I check if tickets have Date and Time , Event Location and Venue , Sell Tickets Option , Get Tickets$/) do
  dd = page.all('.date-date')
  tt = page.all('.time')
  eve = page.all('.event-info')
  sll = page.all('.list-box-right-mobile')
  get = page.all('.action')
  n=dd.size
  puts "Tickets Contain"
  for i in 1..n
    puts dd[i-1].text
    puts tt[i-1].text
    puts eve[i-1].text
    puts sll[i-1].text
    puts get[i-1].text
    puts ""
  end
end

Then(/^I follow New England Patriots$/) do
  page.find('.dropdown-menu',:visible => true).find_link('New England Patriots').trigger('click')
  #save_screenshot('' [1600,1400])
end

Then(/^I press Home$/) do
  page.find('#home').trigger('click')
  expect(page).to have_css('#schedule_gif', :visible => true)
  sleep(8)
end

Then(/^I should see New England Patriots vs\.$/) do
  page.should have_content 'New England Patriots vs'
end

Then(/^I press Away$/) do
  page.find('#away').trigger('click')
  expect(page).to have_css('#schedule_gif', :visible => true)
end

Then(/^I should see vs\. New England Patriots$/) do
  page.should have_content 'vs. New England Patriots'
end

Then(/^I should see Opposing Team filter$/) do
  page.should have_css('div #topFilterSelectButton')
end

Then(/^I select team New York Jets as opposing team$/) do
  select('New York Jets', :from => 'opposing_team')
  page.should have_css('.list-box')
end

Then(/^I should see events with New York Jets$/) do
  page.should have_content 'New York Jets'
  #save_screenshot('' [1600,1400])
end

Then(/^I reset Opposing Team filter$/) do
  select('Opposing Team', :from => 'opposing_team')
  page.should have_css('.list-box')
  #save_screenshot('' [1600,1400])
end

Then(/^I press Schedule$/) do
  page.find('#schedule').trigger('click')
  expect(page).to have_css('#schedule_gif', :visible => true)
end

Then(/^I select the Date filter$/) do
  page.find('#tickets_div > div.row-fluid.margin-top-2.margin-bottom-1.results-filter > div.span5 > div.btn-group.mobile-calendar.pull-right.desktop > a').trigger('click')
end

Then(/^I set the from date to (\d+)\-(\d+)\-(\d+)$/) do |arg1, arg2, arg3|
  page.fill_in('from', :with => arg1.to_s + arg2.to_s + arg3.to_s)
end

Then(/^I set the to date to (\d+)\-(\d+)\-(\d+)$/) do |arg1, arg2, arg3|
  page.fill_in('to', :with => arg1.to_s + arg2.to_s + arg3.to_s)
  #save_screenshot('' [1600,1400])
end

Then(/^I press Refine Search$/) do
  page.find('#btnDateFilter').trigger('click')
  expect(page).to have_css('#schedule_gif', :visible => true)
end

Then(/^I should see events displayed for December$/) do
  page.should_not have_css('#schedule_gif', :visible => true) #wait untill events are loaded
  page.all(:xpath, '//*[@id="teamSchedule"]/div[1]/div/div').each do |arg|
    puts arg.text.gsub(/Sell Tickets GET TICKETS/, '')
    puts "next"
  end
  #save_screenshot('' [1600,1400])
end
