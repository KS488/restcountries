When(/^I search for a  code "([^"]*)"$/) do |search_term|
@r = api(url("alpha/#{search_term}"))
end

Then(/^I should see the country associated with the code$/) do
expect(@r.code).to eq 200 

        @r.each do |country|

		 key_array.each do |key|
		 expect(@r).to have_key(key)
		 end 

	   key_hash.each do |key, value|
     expect(@r[key.to_s]).to be_a(value)
   end 
end 
    expect(@r["latlng"].size).to eq 2
end

When(/^I search Using an incorrect code that doesn't exist like"([^"]*)"$/) do |search_term|
@r = api(url("alpha/#{search_term}"))
end

Then(/^I should get some sort of an error$/) do
expect(@r["message"]).to eq "Not Found"
expect(@r.code).to eq 404 
end