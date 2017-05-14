When(/^I search for "(.+)"$/) do |search_term|
    @r = api(url("name/#{search_term}"))
    	# @browser.goto "https://restcountries.eu/rest/v1/name/#{@countries}"
end

Then(/^I should see a the countrys information$/) do

			expect(@r.code).to eq 200 
			expect(@r.size).to eq 1 
		  key_array.each do |key|
		  expect(@r[0]).to have_key(key)
		 end
		 key_hash.each do |key, value|
     expect(@r[0][key.to_s]).to be_a(value)
     end 
     expect(@r[0]["latlng"].size).to eq 2

end

When(/^I search for a country that doesn't exist like"([^"]*)"$/) do |search_term|
	@r = api(url("name/#{search_term}"))
	# @browser.goto "https://restcountries.eu/rest/v1/name/#{@noncountry}"
end

Then(/^I should get an error$/) do
expect(@r["message"]).to eq "Not Found"
expect(@r.code).to eq 404 
end