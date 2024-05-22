////import Foundation
//import JWTKit
//
//class Header {
//    var kty: String
//    var typ: String
//    var n: String
//    var e: String
//    
//    init(kty: String, typ: String, n: String, e: String) throws {
//        guard !kty.isEmpty, !typ.isEmpty, !n.isEmpty, !e.isEmpty else {
//            throw InvalidPublicKeyError.invalidInput
//        }
//        self.kty = kty
//        self.typ = typ
//        self.n = n
//        self.e = e
//    }
//    
//    public func getHeader() -> JWTHeader {
//        let header = JWTHeader(fields: [
//            "typ": .string(typ),
//            "jwk": [
//                "n": .string(n),
//                "e": .string(e),
//                "kty": .string(kty)
//            ]
//        ])
//        return header
//    }
//}
