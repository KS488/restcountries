When(/^I search for the region  "([^"]*)"$/) do |search_term|
 @r = api(url("region/#{search_term}"))
 # @browser.goto "https://restcountries.eu/rest/v1/region/#{@Region}" 
  
end

Then(/^I should see all  the countries in the Region$/) do
  expect(@r.code).to eq 200 
 
  @r.each do |country|

    key_array.each do |key|
		expect(country).to have_key(key)
	end

  key_hash.each do |key, value|
     expect(country[key.to_s]).to be_a(value)
   end

end 
     expect(@r[0]["latlng"].size).to eq 2
   end
