import Vapor
import Foundation

struct Country {
    let name: String
    let code: String
    let police: Int
    let medical: Int
    let fire: Int
}

extension Country {
    func toResponse() -> ResponseRepresentable {
        return Json(["name": name,
                     "code": code,
                     "police": police,
                     "medical": medical,
                     "fire": fire])
    }
}

class DataSource {
    
    static let source = [Country(name: "Switzerland", code: "CH", police: 120, medical: 0, fire: 0).self,
                         Country(name: "", code: "", police: 0, medical: 0, fire: 0).self,
                         Country(name: "", code: "", police: 0, medical: 0, fire: 0).self,
                         Country(name: "", code: "", police: 0, medical: 0, fire: 0).self]
    
}