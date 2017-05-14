When(/^I search for a capital city like "([^"]*)"$/) do |search_term|
@r = api(url("capital/#{search_term}"))
end

Then(/^I should see the country associated with the capital city$/) do
     expect(@r.code).to eq 200 
		 key_array.each do |key|
		 expect(@r[0]).to have_key(key)
		 end
	

	   key_hash.each do |key, value|
     expect(@r[0][key.to_s]).to be_a(value)
   end 
     expect(@r[0]["latlng"].size).to eq 2
end

When(/^I search Using a capital city that doesn't exist like"([^"]*)"$/) do |search_term|
@r = api(url("capital/#{search_term}"))
end

Then(/^I should get an error message$/) do
expect(@r["message"]).to eq "Not Found"
expect(@r.code).to eq 404 
end
