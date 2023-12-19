when("the user is on the experiment test filtering screen") do
  visit '/filtros'
end

And("the user select {string} in the experiment dropdown") do |experimento|
  select experimento, from: experimento
end

And("the user select {string} in the status dropdown") do |status|
  select status, from: status
end

And("the user clicks on the filter button") do
  click_button 'commit'
end

Then("the user should see a list of filtered tests") do
  expect(page).to have_content('printar_no_final')
end

And("there are no tests with the selected filters")
end

Then("the user should see a warning message if no tests are associated") do
  expect(page).to have_content(string)
end
