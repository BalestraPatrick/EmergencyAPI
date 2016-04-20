import Vapor

let app = Application()

/*
    Return JSON containg the emergency phone numbers.
 
    version : 0.1
    country: name, code, police, medical, fire
*/
app.get("/") { request in
    let first: ResponseRepresentable = DataSource().source.first!.toResponse()
    print(first)
    return Json([
                    "version": 0.1,
                    "content": first
    ])
}

/*
    GET : /country
    parameter: 2-digit country code
*/
app.get("country", String.self) { request, countryCode in
    let country = DataSource().source.filter { $0.code == countryCode }
    guard let result = country.first else {
        return Json(["error": "No country found with the given 2-digit country code \(countryCode)"])
    }
    return result.toResponse()
}

app.start(port: 8060)
