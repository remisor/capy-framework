# @okinsidesbox

Given(/^I am testing Search Features on Fanxchange$/) do
  visit "https://devteam:xkc2nXV8@staging.www.fanxchange.com"
end

Then(/^I should see the search bar$/) do
  expect(page).to have_css('#search')
end

Then(/^I fill in search with Toronto$/) do
  sleep(10)
  page.fill_in('search', :with => 'Toronto')
  save_screenshot(''[1600,1200])
  sleep(3)
end

Then(/^I press GO!$/) do
  page.driver.header "Authorization","Basic ZGV2dGVhbTp4a2MyblhWOA==" #server needed authorization again ...
  page.find('#submit').trigger('click')
  save_screenshot('/home/voicemailtel/Cuke/test-data/reports/screenshots/Toronto.png' [1600,1200])
end

Then(/^I should see We've got your tickets!$/) do
  page.should have_content "We've got your tickets!"
end

Then(/^I should see Results for Toronto$/) do
  page.should have_content "Results for 'Toronto'"
  save_screenshot('/home/voicemailtel/Cuke/test-data/reports/screens/Toronto.png' [1600,1200])
end

# @notokinsidesbox

Then(/^I fill in search with dsdsdDd$/) do
  page.fill_in('search', :with => 'dsdsdDd')
end

Then(/^I should see There could be a few reasons why nothing turned up in your search:$/) do
  puts url
  page.should have_content "There could be a few reasons why nothing turned up in your search:"
end

Then(/^I wait for drop down search results$/) do
  page.should have_css('.ui-autocomplete')
  save_screenshot('/home/voicemailtel/Cuke/test-data/reports/screens/Toronto.png' [1600,1200])
end

Then(/^I should see drop down results for search query$/) do
  puts "Performers"
  i=0
  page.all(:css, '.ui-menu-item').each do |arg|
    i=i+1
      if i==5 
        puts 'Events'
      end
      if i>1
        puts arg.text
      end 
  end
end

Then(/^I click the first event in the search query$/) do
  #                  //*[@id="ui-id-1"]/div[2]/div[2]/li[1]/a
  page.find(:xpath, '//*[@id="ui-id-1"]/div[2]/div[2]/li[1]/a').trigger('click')
end

Then(/^I should see Toronto FC tickets$/) do
  page.should have_content "Toronto FC tickets"
end

Then(/^I follow Concerts$/) do
  page.find(:xpath, '//*[@id="closepls"]/div[1]/div/div/div/ul/li[5]/a').trigger('click')
end

Then(/^I follow Beyonce$/) do
  page.find(:xpath, '//*[@id="closepls"]/div[1]/div/div/div/ul/li[5]/ul/li[1]/a').trigger('click')
  save_screenshot('/home/voicemailtel/Cuke/test-data/reports/screens/Beyonce.png' [1600,1200])
end
