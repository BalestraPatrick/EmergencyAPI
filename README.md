# EmergencyAPI
An API written in Swift for the world emergency phone numbers. The API is visible here: [http://emergency-phone-numbers.herokuapp.com/](http://emergency-phone-numbers.herokuapp.com/)

## Usage
The API is used to perform the following operations:

- Request all the available countries data
- Request a specific country data given the 2-letter country code (such as US for United States, CH for Switzerland, etc.)
- Request the flag image given the 2-letter country code.

### Documentation
#### GET /
By performing a GET request directly to the base URL, you will receive a JSON file like this:

```JSON
{
 "content":[
			{
			 "name":"Switzerland",
			 "code":"CH",
			 "police":"112",
	 		 "medical":"144",
	 		 "fire":"118"
	  	 	},
	 		{
	 		 "name":"Italy",
	 		 "code":"IT",
	 		 "police":"112",
	 		 "medical":"118",
	 		 "fire":"115"
	 		 }
	 		],
 "version":0.1
}
```

The `version` value is a number representing the current version of the data. More versions may be released in the future with improved numbers and added countries.
The `content` value is an array of dictionaries containing the country data: 

- `name`: name of the country
- `code`: 2-letter country code
- `fire`: firefighters phone number
- `police`: police phone number
- `medical`: medical phone number

### GET /country/
Perform a GET request in this format `/country/{2-letter country code}` by passing a valid country code ([ISO 3166-1 alpha-2 format](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)) to receive the emergency phone numbers for the specified country. If the country code is not found in the database, the API returns an error like this:

```JSON
{"error": "No country found with the given 2-letter country code CHH"}
```
If the request is succesfful, the response is something like this:

```JSON
{
 "code":"CH",
 "fire":"118",
 "police":"112",
 "name":"Switzerland",
 "medical":"144"
}
```

### GET/images/
Performs a GET request in this format `/images/{2-letter country code}.jpg` by passing a valid country code to receive the flag image for the specified country. The request `/images/CH.jpg` will return the Switzerland flag for example.

## Implementation
This project is based on the great web framework for Swift [Vapor](https://github.com/qutheory/vapor/).

## Contribution
If you find any mistakes in the list of emergency phone numbers or you would like to add any new country, feel free to open a [Pull Request](https://github.com/BalestraPatrick/EmergencyAPI/pull/new/master) 👏🏻

## Contact

I'm [Patrick Balestra](http://www.patrickbalestra.com).
Email: [me@patrickbalestra.com](mailto:me@patrickbalestra.com)
Twitter: [@BalestraPatrick](http://twitter.com/BalestraPatrick).

## License

`EmergencyAPI` is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
