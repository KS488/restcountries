Given(/^I am on the api Home page$/) do
 @r = HTTParty.get 'https://restcountries.eu/rest/v1/all'
end

When(/^I search for  all countries$/) do
  @r = HTTParty.get url("all")
end

Then(/^I should be able to view all the countries$/) do
	expect(@r.code).to eq 200
	expect(@r.content_type).to eq "application/json"
	expect(@r.size).to eq 250
end 

Then(/^Its details listed$/) do

	keys_hash = {
		"name": String,
		"topLevelDomain": Array,
		"alpha2Code": String,
		"alpha3Code": String,
		"callingCodes": Array,
		"altSpellings": Array,
		"relevance": String,
		"subregion": String ,
		"region": String,
		"population": Integer,
		"latlng": Array ,
		"demonym": String ,
		"area": Float ,
		# "gini": Float,
		"timezones": Array,
		"borders": Array,
		"nativeName": String,
		"numericCode": String,
    "currencies": Array,
    "languages": Array,
    "translations": Hash
  }
	@r.each do |country|

  	 begin
  		keys_hash.each do |key, value|
  			begin
  			expect(country).to have_key(key.to_s)
  			rescue
  				puts "#{country} - #{key}"
  			ensure
  				next
  			end
  			begin
  			expect(country[key.to_s]).to be_a(value)
	  		rescue
	  			puts "#{country} - #{key}"
	  		ensure
	  			next
	  		end
  		end 
	  	# expect(country["translations"]).to be_a Hash
	  	# expect(country["topLevelDomain"]).to be_a Array 
	  	# expect(country["callingCodes"]).to be_a Array
	  	# expect(country["altSpellings"]).to be_a Array
	  	# expect(country["latlng"]).to be_a Array
	  	# expect(country["timezones"]).to be_a Array
	  	# expect(country["borders"]).to be_a Array
	  	# expect(country["currencies"]).to be_a Array
	  	# expect(country["languages"]).to be_a Array
	    expect(country["latlng"].size).to eq 2
	  rescue RSpec::Expectations::ExpectationNotMetError
	  	puts country["name"]
	  	fail
	  ensure 
	  	 next 
	  end 
	end 
end

When(/^I search for "(.+)"$/) do |search_term|
    @r = HTTParty.get url("name/#{search_term}") 
    	# @browser.goto "https://restcountries.eu/rest/v1/name/#{@countries}"
end

Then(/^I should see a the countrys information$/) do

	expect(@r.code).to eq 200      
  expect(@r[0]).to have_key("name")
	expect(@r[0]).to have_key("topLevelDomain")
	expect(@r[0]).to have_key("alpha2Code")
	expect(@r[0]).to have_key("alpha3Code")
	expect(@r[0]).to have_key("callingCodes")
	expect(@r[0]).to have_key("altSpellings")
	expect(@r[0]).to have_key("relevance")
	expect(@r[0]).to have_key("subregion")
	expect(@r[0]).to have_key("population")
	expect(@r[0]).to have_key("latlng")
	expect(@r[0]).to have_key("demonym")
	expect(@r[0]).to have_key("area")
	expect(@r[0]).to have_key("gini")
	expect(@r[0]).to have_key("timezones")
	expect(@r[0]).to have_key("borders")
	expect(@r[0]).to have_key("nativeName")
	expect(@r[0]).to have_key("numericCode")
	expect(@r[0]).to have_key("currencies")
	expect(@r[0]).to have_key("languages")
	expect(@r[0]).to have_key("translations")

	expect(@r[0]["translations"]).to be_a Hash
	expect(@r[0]["topLevelDomain"]).to be_a Array 
	expect(@r[0]["callingCodes"]).to be_a Array
	expect(@r[0]["altSpellings"]).to be_a Array
	expect(@r[0]["latlng"]).to be_a Array
	expect(@r[0]["timezones"]).to be_a Array
	expect(@r[0]["borders"]).to be_a Array
	expect(@r[0]["currencies"]).to be_a Array
	expect(@r[0]["languages"]).to be_a Array
  expect(@r[0]["latlng"].size).to eq 2

end

When(/^I search for a country that doesn't exist like "([^"]*)"$/) do |search_term|
	@r = HTTParty.get url("name/#{search_term}")  
	# @browser.goto "https://restcountries.eu/rest/v1/name/#{@noncountry}"
end

Then(/^I should get an error$/) do
expect(@r["message"]).to eq "Not Found"
expect(@r.code).to eq 404 
end

When(/^I search for the region  "([^"]*)"$/) do |search_term|
@Region = search_term
 @r = HTTParty.get url("region/#{@Region}")

 # @browser.goto "https://restcountries.eu/rest/v1/region/#{@Region}" 
  
end

Then(/^I should see all  the countries in the Region$/) do
    expect(@r.code).to eq 200 
 end

