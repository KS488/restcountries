
def url(uri)
  "https://restcountries.eu/rest/v1/" + uri
end


def key_array
   ["name","topLevelDomain","alpha2Code","alpha3Code","callingCodes","altSpellings","relevance","subregion","region","population","latlng","demonym","area","gini","timezones","borders","nativeName","numericCode","currencies","languages","translations" ]
end 


def key_hash
	{
		"topLevelDomain": Array,
		"callingCodes": Array,
		"altSpellings": Array,
		"latlng": Array ,
		"timezones": Array,
		"borders": Array,
		"currencies": Array,
        "languages": Array,
        "translations": Hash
  }
end 

def api(url)

	HTTParty.get(url)
end 