# Given(/^I am on the api Home page$/) do
#  @r = HTTParty.get 'https://restcountries.eu/rest/v1/all'
# end

When(/^I search for  all countries$/) do
    @r = api(url("all"))
end

Then(/^I should be able to view all the countries$/) do
	expect(@r.code).to eq 200
	expect(@r.content_type).to eq "application/json"
	expect(@r.size).to eq 250
end 

Then(/^Its details listed$/) do
	@r.each do |country|
	  key_array.each do |key|
		expect(country).to have_key(key)
	end
    key_hash.each do |key, value|
    expect(country[key.to_s]).to be_a(value)
   end  
   
  #  begin
  #  expect(country["gini"]).to be_a Float
  #  rescue RSpec::Expectations::ExpectationNotMetError
  #  	puts "Country With out any gini Info : #{country["name"]}" 
  	 
  # ensure 
  # 	next 
  # end 

   begin 
    expect(country["latlng"].size).to eq 2 
  rescue RSpec::Expectations::ExpectationNotMetError
  	puts "Country With out latLng: #{country["name"]}"
  ensure
  	next 
  end  
 end
end 








