import Vapor

let app = Application()

/*
    Return JSON containg the emergency phone numbers.
 
    version : 0.1
    country: name, code, police, medical, fire
*/
app.get("/") { request in
    return Json([
                    "version": 0.1,
                    "content": [
                                   ["country": "Switzerland",
                                    "code": "CH",
                                    "police": 112,
                                    "medical": 144,
                                    "fire": 118],
                                   ["name": "Switzerland",
                                    "code": "CH",
                                    "police": 112,
                                    "medical": 144,
                                    "fire": 118]
        ]
    ])
}

/*
    GET : /country
    parameter: 2-digit country code
*/
app.get("country", String.self) { request, countryCode in
    let country = DataSource.source.filter { $0.code == countryCode }
    guard let result = country.first else {
        return Json(["error": "No country found with the given 2-digit country code \(countryCode)"])
    }
    return result.toResponse()
}

app.start(port: 8058)
