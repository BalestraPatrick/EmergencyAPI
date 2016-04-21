import Vapor
import Foundation

struct Country {
    let name: String
    let code: String
    let police: Int
    let medical: Int
    let fire: Int
}

extension Country: JsonRepresentable {
    
    func makeJson() -> Json {
        return Json(["name": name,
                     "code": code,
                     "police": police,
                     "medical": medical,
                     "fire": fire])
    }
}

class DataSource: JsonRepresentable {
    
    
    func makeJson() -> Json {
        let content = DataSource().source.map { $0.makeJson() }
        return Json.object(["version" : Json(APIVersion), "content": Json.array(content)])
    }
    
    func getCountryWithID(countryCode: String) -> Json {
        let country = source.filter { $0.code == countryCode }
        guard let result = country.first else {
            return Json(["error": "No country found with the given 2-letter country code \(countryCode)"])
        }
        return result.makeJson()
    }

    let APIVersion = 0.1

    let source = [Country(name: "Afghanistan", code: "AF", police: 119, medical: 102, fire: 119).self,
                  Country(name: "Albania", code: "AL", police: 129, medical: 127, fire: 128).self,
                  Country(name: "Algeria", code: "DZ", police: 17, medical: 14, fire: 14).self,
                  Country(name: "Argentina", code: "AR", police: 101, medical: 107, fire: 100).self,
                  Country(name: "Armenia", code: "AM", police: 102, medical: 103, fire: 101).self,
                  Country(name: "Austria", code: "AT", police: 112, medical: 112, fire: 112).self,
                  Country(name: "Australia", code: "AU", police: 000, medical: 000, fire: 000).self,
                  Country(name: "Bahrain", code: "BH", police: 999, medical: 999, fire: 999).self,
                  Country(name: "Bangladesh", code: "BD", police: 100, medical: 101, fire: 102).self,
                  Country(name: "Barbados", code: "BB", police: 911, medical: 911, fire: 911).self,
                  Country(name: "Belarus", code: "BY", police: 102, medical: 103, fire: 112).self,
                  Country(name: "Belgium", code: "BE", police: 112, medical: 112, fire: 112).self,
                  Country(name: "Bolivia", code: "BO", police: 110, medical: 118, fire: 119).self,
                  Country(name: "Bosnia and Herzegovina", code: "BA", police: 122, medical: 124, fire: 123).self,
                  Country(name: "Botswana", code: "BW", police: 999, medical: 997, fire: 998).self,
                  Country(name: "Brazil", code: "BR", police: 190, medical: 192, fire: 103).self,
                  Country(name: "Brunei", code: "BN", police: 993, medical: 991, fire: 995).self,
                  Country(name: "Bulgaria", code: "BG", police: 122, medical: 112, fire: 112).self,
                  Country(name: "Canada", code: "CA", police: 911, medical: 911, fire: 911).self,
                  Country(name: "Cayman Islands", code: "KY", police: 911, medical: 911, fire: 911).self,
                  Country(name: "Chad", code: "TD", police: 17, medical: 0, fire: 18).self,
                  Country(name: "Chile", code: "CL", police: 133, medical: 131, fire: 132).self,
                  Country(name: "China", code: "CN", police: 110, medical: 120, fire: 119).self,
                  Country(name: "Colombia", code: "CO", police: 112, medical: 112, fire: 112).self,
                  Country(name: "Costa Rica", code: "CR", police: 911, medical: 911, fire: 911).self,
                  Country(name: "Croatia", code: "HR", police: 112, medical: 112, fire: 112).self,
                  Country(name: "Cyprus", code: "CY", police: 112, medical: 112, fire: 112).self,
                  Country(name: "Czech Republic", code: "CZ", police: 158, medical: 155, fire: 112).self,
                  Country(name: "Denmark", code: "DK", police: 112, medical: 112, fire: 112).self,
                  Country(name: "Djibouti", code: "DJ", police: 17, medical: 18, fire: 18).self,
                  Country(name: "Dominican Republic", code: "DO", police: 999, medical: 990, fire: 990).self,
                  Country(name: "Ecuador", code: "EC", police: 911, medical: 911, fire: 911).self,
                  Country(name: "Egypt", code: "EG", police: 122, medical: 123, fire: 180).self,
                  Country(name: "Estonia", code: "EE", police: 112, medical: 112, fire: 112).self,
                  Country(name: "Faroe Islands", code: "FO", police: 112, medical: 112, fire: 112).self,
                  Country(name: "Fiji", code: "FJ", police: 112, medical: 911, fire: 9170).self,
                  Country(name: "Finland", code: "FI", police: 112, medical: 112, fire: 112).self,
                  Country(name: "France", code: "FR", police: 191, medical: 112, fire: 112).self,
                  Country(name: "Georgia", code: "GE", police: 112, medical: 112, fire: 122).self,
                  Country(name: "Germany", code: "DE", police: 110, medical: 112, fire: 112).self,
                  Country(name: "Ghana", code: "GH", police: 112, medical: 193, fire: 192).self,
                  Country(name: "Gibraltar", code: "GI", police: 112, medical: 190, fire: 190).self,
                  Country(name: "Greece", code: "GR", police: 112, medical: 112, fire: 199).self,
                  Country(name: "Greenland", code: "GL", police: 112, medical: 112, fire: 112).self,
                  Country(name: "Guatemala", code: "GT", police: 110, medical: 112, fire: 123).self,
                  Country(name: "Guyana", code: "GY", police: 911, medical: 913, fire: 912).self,
                  Country(name: "Haiti", code: "HT", police: 118, medical: 118, fire: 118).self,
                  Country(name: "Honduras", code: "HN", police: 199, medical: 199, fire: 199).self,
                  Country(name: "Hong Kong", code: "HK", police: 999, medical: 999, fire: 999).self,
                  Country(name: "Hungary", code: "HU", police: 112, medical: 112, fire: 112).self,
                  Country(name: "Iceland", code: "IS", police: 112, medical: 112, fire: 112).self,
                  Country(name: "India", code: "IN", police: 100, medical: 102, fire: 101).self,
                  Country(name: "Indonesia", code: "ID", police: 110, medical: 118, fire: 113).self,
                  Country(name: "Iran", code: "IR", police: 110, medical: 115, fire: 125).self,
                  Country(name: "Iraq", code: "IQ", police: 104, medical: 122, fire: 115).self,
                  Country(name: "Ireland", code: "IE", police: 999, medical: 999, fire: 999).self,
                  Country(name: "Israel", code: "IL", police: 100, medical: 101, fire: 102).self,
                  Country(name: "Italy", code: "IT", police: 112, medical: 118, fire: 115).self,
                  Country(name: "Jamaica", code: "JM", police: 118, medical: 199, fire: 199).self,
                  Country(name: "Japan", code: "JP", police: 110, medical: 119, fire: 119).self,
                  Country(name: "Jordan", code: "JO", police: 911, medical: 911, fire: 911).self,
                  Country(name: "Kazakhstan", code: "KZ", police: 112, medical: 112, fire: 112).self,
                  Country(name: "Kuwait", code: "KW", police: 112, medical: 112, fire: 112).self,
                  Country(name: "Latvia", code: "LV", police: 02, medical: 03, fire: 01).self,
                  Country(name: "Lebanon", code: "LB", police: 112, medical: 140, fire: 175).self,
                  Country(name: "Lithuania", code: "LT", police: 02, medical: 03, fire: 01).self,
                  Country(name: "Luxembourg", code: "LU", police: 113, medical: 112, fire: 112).self,
                  Country(name: "Macao", code: "MO", police: 999, medical: 999, fire: 999).self,
                  Country(name: "Macedonia", code: "MK", police: 999, medical: 999, fire: 999).self,
                  Country(name: "Malaysia", code: "MY", police: 102, medical: 102, fire: 102).self,
                  Country(name: "Maldives", code: "MV", police: 17, medical: 15, fire: 18).self,
                  Country(name: "Mali", code: "ML", police: 112, medical: 112, fire: 112).self,
                  Country(name: "Malta", code: "MT", police: 999, medical: 114, fire: 115).self,
                  Country(name: "Mauritius", code: "MU", police: 066, medical: 065, fire: 068).self,
                  Country(name: "Mexico", code: "MX", police: 066, medical: 065, fire: 068).self,
                  Country(name: "Moldova", code: "MD", police: 112, medical: 112, fire: 112).self,
                  Country(name: "Monaco", code: "MC", police: 102, medical: 103, fire: 101).self,
                  Country(name: "Mongolia", code: "MN", police: 112, medical: 112, fire: 112).self,
                  Country(name: "Montenegro", code: "ME", police: 19, medical: 15, fire: 15).self,
                  Country(name: "Morocco", code: "MA", police: 191, medical: 191, fire: 191).self,
                  Country(name: "Myanmar", code: "MM", police: 100, medical: 102, fire: 101).self,
                  Country(name: "Nepal", code: "NP", police: 112, medical: 112, fire: 112).self,
                  Country(name: "Netherlands", code: "NL", police: 112, medical: 112, fire: 112).self,
                  Country(name: "New Zeland", code: "NZ", police: 111, medical: 111, fire: 111).self,
                  Country(name: "Nicaragua", code: "NI", police: 199, medical: 199, fire: 199).self,
                  Country(name: "Nigeria", code: "NG", police: 119, medical: 119, fire: 119).self,
                  Country(name: "North Korea", code: "KP", police: 112, medical: 113, fire: 110).self,
                  Country(name: "Norway", code: "NO", police: 112, medical: 113, fire: 110).self,
                  Country(name: "Oman", code: "OM", police: 15, medical: 115, fire: 16).self,
                  Country(name: "Pakistan", code: "PK", police: 211, medical: 511, fire: 311).self,
                  Country(name: "Panama", code: "PA", police: 911, medical: 911, fire: 911).self,
                  Country(name: "Paraguay", code: "PY", police: 105, medical: 117, fire: 116).self,
                  Country(name: "Peru", code: "PE", police: 117, medical: 117, fire: 117).self,
                  Country(name: "Philippines", code: "PH", police: 997, medical: 999, fire: 998).self,
                  Country(name: "Poland", code: "PL", police: 112, medical: 112, fire: 112).self,
                  Country(name: "Portugal", code: "PT", police: 999, medical: 999, fire: 999).self,
                  Country(name: "Qatar", code: "QA", police: 192, medical: 194, fire: 193).self,
                  Country(name: "Romania", code: "RO", police: 112, medical: 112, fire: 112).self,
                  Country(name: "Russia", code: "RU", police: 02, medical: 02, fire: 02).self,
                  Country(name: "Rwanda", code: "RW", police: 112, medical: 112, fire: 112).self,
                  Country(name: "San Marino", code: "SM", police: 113, medical: 118, fire: 115).self,
                  Country(name: "Saudi Arabia", code: "SA", police: 999, medical: 997, fire: 998).self,
                  Country(name: "Serbia", code: "RS", police: 192, medical: 194, fire: 193).self,
                  Country(name: "Sierra Leone", code: "SL", police: 999, medical: 019, fire: 999).self,
                  Country(name: "Singapore", code: "SG", police: 999, medical: 995, fire: 995).self,
                  Country(name: "Slovakia", code: "SK", police: 158, medical: 155, fire: 150).self,
                  Country(name: "Slovenia", code: "SI", police: 113, medical: 112, fire: 112).self,
                  Country(name: "Solomon Islands", code: "SB", police: 999, medical: 999, fire: 999).self,
                  Country(name: "South Africa", code: "ZA", police: 10111, medical: 10177, fire: 10111).self,
                  Country(name: "South Korea", code: "KR", police: 112, medical: 119, fire: 119).self,
                  Country(name: "Spain", code: "ES", police: 112, medical: 112, fire: 112).self,
                  Country(name: "Sri Lanka", code: "LK", police: 119, medical: 110, fire: 111).self,
                  Country(name: "Sudan", code: "SD", police: 999, medical: 999, fire: 99).self,
                  Country(name: "Suriname", code: "SR", police: 115, medical: 115, fire: 116).self,
                  Country(name: "Sweden", code: "SE", police: 112, medical: 112, fire: 112).self,
                  Country(name: "Switzerland", code: "CH", police: 117, medical: 144, fire: 118).self,
                  Country(name: "Syria", code: "SY", police: 112, medical: 110, fire: 113).self,
                  Country(name: "Taiwan", code: "TW", police: 110, medical: 119, fire: 119).self,
                  Country(name: "Tajikistan", code: "TJ", police: 112, medical: 112, fire: 112).self,
                  Country(name: "Thailand", code: "TH", police: 191, medical: 1669, fire: 199).self,
                  Country(name: "Trinidad and Tobago", code: "TT", police: 999, medical: 990, fire: 990).self,
                  Country(name: "Tunisia", code: "TN", police: 197, medical: 198, fire: 198).self,
                  Country(name: "Turkey", code: "TR", police: 155, medical: 112, fire: 110).self,
                  Country(name: "Turkish Republic Cyprus", code: "CY", police: 112, medical: 112, fire: 112).self,
                  Country(name: "Uganda", code: "UG", police: 999, medical: 999, fire: 999).self,
                  Country(name: "Ukraine", code: "UA", police: 102, medical: 101, fire: 101).self,
                  Country(name: "United Arab Emirates", code: "AE", police: 999, medical: 997, fire: 997).self,
                  Country(name: "United Kingdom", code: "GB", police: 999, medical: 999, fire: 999).self,
                  Country(name: "United States", code: "US", police: 911, medical: 911, fire: 911).self,
                  Country(name: "Uruguay", code: "UY", police: 911, medical: 911, fire: 911).self,
                  Country(name: "Vanuatu", code: "VU", police: 112, medical: 112, fire: 112).self,
                  Country(name: "Vatican City", code: "VA", police: 112, medical: 115, fire: 115).self,
                  Country(name: "Venezuela", code: "VE", police: 171, medical: 171, fire: 171).self,
                  Country(name: "Vietnam", code: "VN", police: 113, medical: 114, fire: 114).self,
                  Country(name: "Zambia", code: "ZM", police: 999, medical: 993, fire: 993).self,
                  Country(name: "Zimbabwe", code: "ZW", police: 995, medical: 993, fire: 993).self]
}