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
                                   ["country": "Switzerland",
                                    "code": "CH",
                                    "police": 112,
                                    "medical": 144,
                                    "fire": 118]
        ]
    ])
}

app.start(port: 8080)
