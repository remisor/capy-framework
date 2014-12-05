Given(/^I am testing Order Features on Fanxchange$/) do
  visit "https://devteam:xkc2nXV8@staging.www.fanxchange.com"
end

Then(/^I should see Enter Member Pass Code$/) do
  page.should have_content 'Enter Member Pass Code'
end

Then(/^I check my order total$/) do
  puts page.find(:p,'.total.price_total_checkout').text
end

Then(/^I press Enter Member Pass Code$/) do
  page.find(:css,'#accordion2 > div:nth-child(1) >a').trigger('click')
  save_screenshot(''[1600,1200])
end

Then(/^I use member pass code: test(\d+)$/) do |arg1|
  page.fill_in('MemberPass',:with => 'test70')
end

Then(/^I use member pass code: perc(\d+)$/) do |arg1|
  page.fill_in('MemberPass',:with => 'perc30')
end

Then(/^I use member pass code: freeshp$/) do
  page.fill_in('MemberPass',:with => 'freeshp')
end

Then(/^I should see Toront Raptors tickets$/) do
  page.should have_content 'Toronto Raptors tickets'
end
