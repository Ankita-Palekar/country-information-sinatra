class Country
	#needs to fetch all countries related 
	
	
	attr_accessor :all_countries, :calling_code, :currency, :region, :sub_region, :country_name, :country_code, :lang, :subregion, :substring, :data_initialisation, :calling_codes_set,  :region_names_set, :sub_region_names_set, :language_codes_set, :cuurencies_set, :country_code_set
		
		
	def initialize
		@base_uri = "https://restcountries.eu/rest/v1"
		@base_uri_images = "https://api.gettyimages.com:443/v3/search/images?"
		@end_point = "artists="
		@api_key = "nwkxwgjamhuacvrb5e6hx7ej"
		@all_countries = "/all"
		@calling_code = "/callingcode/"
		@currency = "/currency/"
		@region = "/region/"
		@sub_region = "/subregion/"
		@country_name = "/name/"
		@country_code = "/alpha/"
		@lang = "/lang/"
		# @@data_initialisation = 0
		# @@region_names_set = Set.new
		# @@country_code_set = Set.new
		# @@sub_region_names_set = Set.new
		# @@calling_codes_set = Set.new
		# @@language_codes_set = Set.new
		# @@cuurencies_set = Set.new
		
		@region_names_set = ["Asia", "Europe", "Africa", "Oceania", "Americas", ""].to_set
		
		@sub_region_names_set = ["Southern Asia", "Northern Europe", "Southern Europe", "Northern Africa", "Polynesia", "Middle Africa", "Caribbean", "South America", "Western Asia", "Australia and New Zealand", "Western Europe", "Eastern Europe", "Central America", "Western Africa", "Northern America", "Southern Africa", "", "Eastern Africa", "South-Eastern Asia", "Eastern Asia", "Melanesia", "Micronesia", "Central Asia"].to_set
		
		 @calling_codes_set = ["93", "358", "355", "213", "1684", "376", "244", "1264", "1268", "54", "374", "297", "61", "43", "994", "1242", "973", "880", "1246", "375", "32", "501", "229", "1441", "975", "591", "5997", "387", "267", "", "55", "246", "1284", "673", "359", "226", "257", "855", "237", "1", "238", "1345", "236", "235", "56", "86", "57", "269", "242", "243", "682", "506", "385", "53", "5999", "357", "420", "45", "253", "1767", "1809", "1829", "1849", "593", "20", "503", "240", "291", "372", "251", "500", "298", "679", "33", "594", "689", "241", "220", "995", "49", "233", "350", "30", "299", "1473", "590", "1671", "502", "44", "224", "245", "592", "509", "504", "852", "36", "354", "91", "62", "225", "98", "964", "353", "972", "39", "1876", "81", "962", "76", "77", "254", "686", "965", "996", "856", "371", "961", "266", "231", "218", "423", "370", "352", "853", "389", "261", "265", "60", "960", "223", "356", "692", "596", "222", "230", "262", "52", "691", "373", "377", "976", "382", "1664", "212", "258", "95", "264", "674", "977", "31", "687", "64", "505", "227", "234", "683", "672", "850", "1670", "47", "968", "92", "680", "970", "507", "675", "595", "51", "63", "48", "351", "1787", "1939", "974", "383", "40", "7", "250", "290", "1869", "1758", "508", "1784", "685", "378", "239", "966", "221", "381", "248", "232", "65", "1721", "421", "386", "677", "252", "27", "82", "211", "34", "94", "249", "597", "4779", "268", "46", "41", "963", "886", "992", "255", "66", "670", "228", "690", "676", "1868", "216", "90", "993", "1649", "688", "256", "380", "971", "598", "998", "678", "58", "84", "681", "967", "260", "263"].to_set

		 @cuurencies_set = ["AFN", "EUR", "ALL", "DZD", "USD", "AOA", "XCD", "ARS", "AMD", "AWG", "AUD", "AZN", "BSD", "BHD", "BDT", "BBD", "BYR", "BZD", "XOF", "BMD", "BTN", "INR", "BOB", "BOV", "BAM", "BWP", "NOK", "BRL", "BND", "BGN", "BIF", "KHR", "XAF", "CAD", "CVE", "KYD", "CLF", "CLP", "CNY", "COP", "KMF", "CDF", "NZD", "CRC", "HRK", "CUC", "CUP", "ANG", "CZK", "DKK", "DJF", "DOP", "EGP", "SVC", "ERN", "ETB", "FKP", "FJD", "XPF", "GMD", "GEL", "GHS", "GIP", "GTQ", "GBP", "GNF", "GYD", "HTG", "HNL", "HKD", "HUF", "ISK", "IDR", "IRR", "IQD", "ILS", "JMD", "JPY", "JOD", "KZT", "KES", "KWD", "KGS", "LAK", "LBP", "LSL", "ZAR", "LRD", "LYD", "CHF", "MOP", "MKD", "MGA", "MWK", "MYR", "MVR", "MRO", "MUR", "MXN", "MDL", "MNT", "MAD", "MZN", "MMK", "NAD", "NPR", "NIO", "NGN", "KPW", "OMR", "PKR", "PAB", "PGK", "PYG", "PEN", "PHP", "PLN", "QAR", "RON", "RUB", "RWF", "SHP", "WST", "STD", "SAR", "RSD", "SCR", "SLL", "SGD", "SDB", "SOS", "KRW", "SSP", "LKR", "SDG", "SRD", "SZL", "SEK", "CHE", "CHW", "SYP", "TWD", "TJS", "TZS", "THB", "TOP", "TTD", "TND", "TRY", "TMT", "UGX", "UAH", "AED", "USN", "USS", "UYI", "UYU", "UZS", "VUV", "VEF", "VND", "YER", "ZMK"].to_set

		 @country_code_set = ["ps", "uz", "tk", "sv", "sq", "ar", "en", "sm", "ca", "pt", "es", "gn", "hy", "ru", "nl", "pa", "de", "az", "bn", "be", "fr", "dz", "ay", "qu", "bs", "hr", "sr", "tn", "ms", "bg", "ff", "rn", "km", "sg", "zh", "ln", "kg", "sw", "lu", "el", "tr", "cs", "sk", "da", "ti", "et", "am", "fo", "fj", "hi", "ur", "fi", "ka", "kl", "ch", "ht", "hu", "is", "id", "fa", "ku", "ga", "gv", "he", "it", "ja", "kk", "ky", "lo", "lv", "st", "lt", "lb", "mk", "mg", "ny", "dv", "mt", "mh", "ro", "mn", "my", "af", "na", "ne", "mi", "ko", "no", "nb", "nn", "pl", "rw", "ta", "sl", "so", "nr", "ss", "ts", "ve", "xh", "zu", "si", "tg", "th", "to", "uk", "bi", "vi", "sn", "nd"].to_set		
 	end

 

	def get_country_images(country_name)
		request_uri = @base_uri_images + @end_point + country_name
		request_uri = URI.encode(request_uri)
		
		result = JSON.parse(open(request_uri, "api-key" => @api_key).read)
		result
	end

	def call_api(action, request_code = "")
		request_uri = (@base_uri + action +  request_code).strip
		request_uri = URI.encode(request_uri)
		result = JSON.parse(open(request_uri).read)
		result
	end

	
 	def get_all_information
 		all_data =  call_api(@all_countries)
 		all_data.each do |country|
 			@region_names_set.add country["region"] 
 			@sub_region_names_set.add country["subregion"]
 			country["callingCodes"].each {|code| @calling_codes_set.add code}
 			country["currencies"].each {|cur| @cuurencies_set.add cur}
 			country["languages"].each {|lang| @language_codes_set.add lang}
 			@country_code_set.add country["alpha2Code"]   
 			@country_code_set.add country["alpha3Code"]   
 		end
 			@data_initialisation = 1
 			
 			puts @region_names_set.inspect
 			puts @sub_region_names_set.inspect
 			puts @calling_codes_set.inspect
 			puts @cuurencies_set.inspect
 			puts @language_codes_set.inspect


 	end
end