Given(/^I navigate to "(.*?)"$/) do |arg1|
  visit arg1
end

Given(/^I fill in "(.*?)" with "(.*?)"$/) do |arg1, arg2|
  page.fill_in('email_address', :with => 'remus.copil@voicemailtel.com')
  page.fill_in('password', :with => 'dontletmedown123')
end

Then(/^I press "(.*?)"$/) do |arg1|
  page.click_button(arg1)
  sleep(2)
  #find(:css, '#loginpanel > table > tbody > tr:nth-child(3) > td > input').trigger('click')
end

Then(/^I should see "(.*?)"$/) do |arg1|
  page.should have_content arg1
end

Then(/^I follow "(.*?)"$/) do |arg1|
  page.click_link(arg1)
end

Then(/^I press on first order$/) do
	#pending
  page.find(:css,'#')
end
