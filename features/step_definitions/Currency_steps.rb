When(/^I search for a currency like "([^"]*)"$/) do |search_term|
@r = api(url("currency/#{search_term}"))
end

Then(/^I should see all the countries associated with the currency$/) do
		expect(@r.code).to eq 200
		expect(@r.size).to be <= 34 

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

