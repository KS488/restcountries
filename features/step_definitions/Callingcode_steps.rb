When(/^I search for a  calling code like "([^"]*)"$/) do |search_term|
@r = api(url("callingcode/#{search_term}"))
end

Then(/^I should see the country associated with the calling code$/) do
     expect(@r.code).to eq 200 
		 key_array.each do |key|
		 expect(@r[0]).to have_key(key)
		 end

     key_hash.each do |key, value|
     expect(@r[0][key.to_s]).to be_a(value)
   end 
     expect(@r[0]["latlng"].size).to eq 2
end
