#!/bin/env ruby
# encoding: utf-8

#char encoding set to utf-8 
Given(/^I am testing Homepage Features on Fanxchange$/) do
  visit "https://devteam:xkc2nXV8@staging.www.fanxchange.com"
end

Then(/^Once the page is loaded$/) do
  sleep(10)
  page.status_code.should == 200
end

Then(/^The title should be FanXchange$/) do
  page.has_title? 'FanXchange'
end

Then(/^I should see Tickets to any live event in one search$/) do
  page.should have_content 'Tickets to any live event in one search'
end

Then(/^I should see the menu$/) do
  page.has_css? '#closepls > div.container.hidden-phone > div > div > div > ul'
end

Then(/^I should see the logo$/) do
  page.has_css? '#closepls > div.container.hidden-phone > div > div > div > a > div'
end

Then(/^I should see NFL$/) do
  page.should have_content 'NFL'
end

Then(/^I should see MLB$/) do
  page.should have_content 'MLB'
end

Then(/^I should see NBA$/) do
  page.should have_content 'NBA'
end

Then(/^I should see NHL$/) do
  page.should have_content 'NHL'
end

Then(/^I should see Concerts$/) do
  page.should have_content 'Concerts'
end

Then(/^I should see Theatre$/) do
  page.should have_content 'Theatre'
end

#new
Then(/^I should see SIGN IN$/) do
  if page.has_css?('.btn-auth-navbar')
    puts "Button is present"
  else
    raise "Button is not present"
  end
end

Then(/^I should see SELL TICKETS$/) do
  if page.has_css? ('#closepls > div.container.hidden-phone > div > div > div > div > a.btn.btn-primary.pull-right.font-12.font-weight-500') 
    puts "Button is present"
  else
    raise "Button is not present"
  end  
end

Then(/^I should see HELP$/) do
  page.should have_content 'HELP'
end

Then(/^I should see the search box$/) do
  if page.has_css?('#searchbox')
    puts "Searchbox is present"
  else
    raise "Searchbox is not present"
  end
end

Then(/^The search placeholder should contain Search by Team, Artist, Event, Date or Venue$/) do
  expect(page).to have_xpath("//*[@id ='search' and @placeholder = 'Search by Team, Artist, Event, Date or Venue']")
end

Then(/^I should see Upcoming Events$/) do
  expect(page).to have_content 'Upcoming Events'
end

Then(/^I should see (\d+) events displayed$/) do |arg1|
  expect(page).to have_css('.list-box', :count => arg1)
end

Then(/^The events displayed should match the location for upcoming events$/) do
  upcoming = page.find_by_id('current_location_pc').text
   puts "The current location is:"
   puts upcoming
   puts "Location for tickets are:"  
  event = all(:xpath, '//*[@id="ticket-container"]/div/div[1]/ul/div').each do |ts|                
    puts ts.text 
  end
end

Then(/^I check that the tickets displayed do not have past dates$/) do
  puts "Dates for current events displayed:"
  all(:css, ".date").each  do |div|   
    puts div.text
  end
end

# @noticket

Then(/^I go to the (\d+). displayed event$/) do |arg|
                    #   
  page.find(:xpath, "//*[@id='ticket-container']/div/div[1]/ul/div[#{arg}]/div[1]/div[2]/table/tbody/tr/td/a").trigger("click")
  page.should have_content 'tickets available' #wait por page load
end

Then(/^I go to the first displayed event$/) do
  page.find(:xpath, "//*[@id='teamSchedule']/div[1]/div/div[1]/div[1]/div[2]/table/tbody/tr/td/a").trigger("click")
  page.should have_content 'tickets available' #wait por page load
end


Then(/^I should see event details$/) do
  puts page.find(:css, 'body > div.container > div.row.hidden-phone > div > h1').text 
  puts page.find(:css, 'body > div.container > div.row.hidden-phone > div > p').text
end

Then(/^I check if tickets are available for the current event$/) do
  
  puts page.find(:css, '#mapPageTicketTitle').text
end

Then(/^I go back$/) do
  page.evaluate_script('window.history.back()')
end

# @popularevents
Then(/^I should see Popular Events$/) do
  page.should have_content 'Popular Events'
end

Then(/^I should see Upcoming Events section$/) do
  page.should have_content 'Upcoming Events'
end

Then(/^I check if displayed popular events are shown for future events$/) do
  puts "Dates for current popular events displayed:"
  all(:css, ".popular-event-details-limit-chars").each do |divivo|   
    puts divivo.text 
  end
end

# @footer

Then(/^I should see Buy Tickets With Confidence$/) do
  page.should have_content 'Buy Tickets With Confidence'
end

Then(/^I should see Choose from over (\d+) million tickets for sports, concerts, and theater events, all listed by FanXchange\-verified sellers, and buy them securely online in minutes\.$/) do |arg1|
  page.should have_content 'Choose from over 6 million tickets for sports, concerts, and theater events, all listed by FanXchange-verified sellers, and buy them securely online in minutes.'
end

Then(/^I should see Sell Tickets With Ease$/) do
  page.should have_content 'Sell Tickets With Ease'
end

Then(/^I should see Sell your sports, concert, and theater tickets securely and instantly to fans around the world: just list your tickets and FanXchange handles the rest, all with the lowest fees around\.$/) do
  page.should have_content 'Sell your sports, concert, and theater tickets securely and instantly to fans around the world: just list your tickets and FanXchange handles the rest, all with the lowest fees around.'
end

Then(/^I should see The FanXchange Guarantee is our commitment to our valued clientele that they will be (\d+)% protected against fraud and your tickets will always arrive on time for the event\. Whether you are buying or selling tickets in our marketplace FanX Guarantee assures that every transaction will be completed in a safe and secure environment\.$/) do |arg1|
  page.should have_content 'The FanXchange Guarantee is our commitment to our valued clientele that they will be 100% protected against fraud and your tickets will always arrive on time for the event. Whether you are buying or selling tickets in our marketplace FanX Guarantee assures that every transaction will be completed in a safe and secure environment. '
end

Then(/^I should see Read More$/) do
  page.should have_content 'Read More'
end

#footerlinks

Then(/^I should see NFL TICKETS$/) do
  page.should have_content 'NFL TICKETS'
end

Then(/^I should see Baltimore Ravens$/) do
  page.should have_content 'Baltimore Ravens'
end

Then(/^I should see San Fransisco (\d+)ers$/) do |arg1|
  page.should have_content 'San Fransisco 49ers'
end

Then(/^I should see New England Patriots$/) do
  page.should have_content 'New England Patriots'
end

Then(/^I should see Dallas Cowboys$/) do
  page.should have_content 'Dallas Cowboys'
end

Then(/^I should see Washington Redskins$/) do
  page.should have_content 'Washington Redskins'
end

Then(/^I should see Green Bay Packers$/) do
  page.should have_content 'Green Bay Packers'
end

Then(/^I should see NBA TICKETS$/) do
  page.should have_content 'NBA TICKETS'
end

Then(/^I should see Toronto Raptors$/) do
  page.should have_content 'Toronto Raptors'
end

Then(/^I should see New York Knicks$/) do
  page.should have_content 'New York Knicks'
end

Then(/^I should see Miami Heat$/) do
  page.should have_content 'Miami Heat'
end

Then(/^I should see Boston Celtics$/) do
  page.should have_content 'Boston Celtics'
end

Then(/^I should see Los Angeles Lakers$/) do
  page.should have_content 'Los Angeles Lakers'
end

Then(/^I should see Oklahoma City Thunder$/) do
  page.should have_content 'Oklahoma City Thunder'
end

Then(/^I should see NHL TICKETS$/) do
  page.should have_content 'NHL TICKETS'
end

Then(/^I should see Toronto Maple Leafs$/) do
  page.should have_content 'Toronto Maple Leafs'
end

Then(/^I should see Chicago Blackhawks$/) do
  page.should have_content 'Chicago Blackhawks'
end

Then(/^I should see New York Rangers$/) do
  page.should have_content 'New York Rangers'
end

Then(/^I should see Boston Bruins$/) do
  page.should have_content 'Boston Bruins'
end

Then(/^I should see Detroit Red Wings$/) do
  page.should have_content 'Detroit Red Wings'
end

Then(/^I should see Montreal Canadiens$/) do
  page.should have_content 'Montreal Canadiens'
end

Then(/^I should see MLB TICKETS$/) do
  page.should have_content 'MLB TICKETS'
end

Then(/^I should see Toronto Blue Jays$/) do
  page.should have_content 'Toronto Blue Jays'
end

Then(/^I should see San Francisco Giants$/) do
  page.should have_content 'San Francisco Giants'
end

Then(/^I should see New York Yankees$/) do
  page.should have_content 'New York Yankees'
end

Then(/^I should see Boston Red Sox$/) do
  page.should have_content 'Boston Red Sox'
end

Then(/^I should see Philadelphia Phillies$/) do
  page.should have_content 'Philadelphia Phillies'
end

Then(/^I should see CONCERT TICKETS$/) do
  page.should have_content 'CONCERT TICKETS'
end

Then(/^I should see Jonas Brothers$/) do
  page.should have_content 'Jonas Brothers'
end

Then(/^I should see Justin Bieber$/) do
  page.should have_content 'Justin Bieber'
end

Then(/^I should see Lady Gaga$/) do
  page.should have_content 'Lady Gaga'
end

Then(/^I should see Roger Waters$/) do
  page.should have_content 'Roger Waters'
end

Then(/^I should see Carrie Underwood$/) do
  page.should have_content 'Carrie Underwood'
end

Then(/^I should see Kiss$/) do
  page.should have_content 'Kiss'
end

Then(/^I should see Black Eyed Peas$/) do
  page.should have_content 'Black Eyed Peas'
end

Then(/^I should see THEATRE TICKETS$/) do
  page.should have_content 'THEATRE TICKETS'
end
Then(/^I should see The Book of Mormon$/) do
  page.should have_content 'The Book of Mormon'
end

Then(/^I should see Lion King$/) do
  page.should have_content 'Lion King'
end

Then(/^I should see Wicked$/) do
  page.should have_content 'Wicked'
end

Then(/^I should see Jersey Boys$/) do
  page.should have_content 'Jersey Boys'
end

# @footerscrolldown

Then(/^I should see FanXchange$/) do
  page.should have_content 'FanXchange'
end

Then(/^I should see Our Team$/) do
  page.should have_content 'Our Team'
end

Then(/^I should see About Us$/) do
  page.should have_content 'About Us'
end

Then(/^I should see Jobs$/) do
  page.should have_content 'Jobs'
end

Then(/^I should see Press$/) do
  page.should have_content 'Press'
end

Then(/^I should see Legal$/) do
  page.should have_content 'Legal'
end

Then(/^I should see More Info$/) do
  page.should have_content 'More Info'
end

Then(/^I should see Help$/) do
  page.should have_content 'Help'
end

Then(/^I should see Contact Us$/) do
  page.should have_content 'Contact Us'
end

Then(/^I should see Photo Credits$/) do
  page.should have_content 'Photo Credits'
end

Then(/^I should see Site Map$/) do
  page.should have_content 'Site Map'
end

Then(/^I should see Show Us Some Love$/) do
  page.should have_content 'Show Us Some Love'
end

Then(/^I should see Facebook$/) do
  page.should have_content 'Facebook'
end

Then(/^I should see Twitter$/) do
  page.should have_content 'Twitter'
end

Then(/^I should see Instagram$/) do
  page.should have_content 'Instagram'
end

Then(/^I should see the Badges section$/) do
  page.find(:css, 'body > footer > div.footer > div > div > div.span4.tablet-footer-span4.right > div')
end

Then(/^I should see ©(\d+) FanXchange\. All Rights Reserved\.$/) do |arg1|
  page.should have_content '©2014 FanXchange. All Rights Reserved.'
end


# @changelocation

Then(/^I follow Change Location$/) do
  page.find(:css, '#ch_loc').trigger('click')
  #save_screenshot('' [1600,1400])
end

Then(/^I use zip code M(\d+)C(\d+)S(\d+)$/) do |arg1, arg2, arg3|
  if page.find(:css, '#zip' , :visible =>true)
     page.find(:css, '#zip').set 'M4C1S2'
  else
    raise "Change zip code field couldn't be found"
  end 
  save_screenshot('' [1600,1400])
end

Then(/^I Change Location$/) do
  page.find(:css, '#cahange_location_xx').trigger('click')

end

Then(/^I should see upcoming events for Toronto, Ontario$/) do
  expect(page).to have_content 'Toronto, Ontario'
  save_screenshot('' [1600,1400])
end

Then(/^I use city New York$/) do
  if page.find(:css, '#city' , :visible =>true)
     page.find(:css, '#city').set 'New York'
  else
    raise "Change city field couldn't be found"
  end 
  save_screenshot('' [1600,1400])
end

Then(/^I should see State\/Province field is required!$/) do
  expect(page).to have_content 'State/Province field is required!'
  save_screenshot('' [1600,1400])
end

Then(/^I use city Prac$/) do
  if page.find(:css, '#city' , :visible =>true)
     page.find(:css, '#city').set 'Prac'
  else
    raise "Change city field couldn't be found"
  end 
  save_screenshot('' [1600,1400])
end

Then(/^I use state Pirac$/) do
  if page.find(:css, '#state' , :visible =>true)
     page.find(:css, '#state').set 'Pirac'
  else
    raise "Change state field couldn't be found"
  end 
  save_screenshot('' [1600,1400])
end

Then(/^I should see upcoming events for New York, New York$/) do
  expect(page).to have_content 'Upcoming Events in New York, New York'
end

Then(/^I use state New York$/) do
  if page.find(:css, '#state' , :visible =>true)
     page.find(:css, '#state').set 'New York'
  else
    raise "Change state field couldn't be found"
  end 
  save_screenshot('' [1600,1400])
end

Given(/^I navigate to https:\/\/proxylistpro\.com\/\#proxy$/) do
  visit 'https://proxylistpro.com/#proxy'
end

Then(/^I use address http:\/\/www\.fanxchange\.com$/) do
  if page.find(:css, '#address' , :visible =>true)
     page.find(:css, '#address').set 'https://devteam:xkc2nXV8@staging.www.fanxchange.com'
  else
    raise "Change address field couldn't be found"
  end 
  save_screenshot('' [1600,1400])
end

Then(/^I use Dalas for location$/) do
  pending #to be made
  #select('dallas.proxylistpro.com', :from => 'select-location')
  #page.find(:css, '#select-location').select_value 'dallas.proxylistpro.com'
  #save_screenshot('' [1600,1400])
end

Then(/^I open the connection$/) do
  #page.find(:css, '.button').trigger('click')
end
#<option value="dallas.proxylistpro.com">United States, Dalas - free slots 27</option>