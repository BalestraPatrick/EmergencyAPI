import Vapor

let app = Application()

/*
    GET: /
    Return JSON containg the emergency phone numbers.
*/
app.get("/") { request in
    return DataSource().makeJson()
}

/*
    GET: /country
    parameter: 2-letter country code
*/
app.get("country", String.self) { request, countryCode in
    return DataSource().getCountryWithID(countryCode)
}

app.start(port: 8062)
