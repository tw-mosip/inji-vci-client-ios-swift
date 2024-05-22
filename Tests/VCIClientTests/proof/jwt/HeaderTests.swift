//import XCTest
//import JWTKit
//@testable import VCIClient
//
//class HeaderTests: XCTestCase {
//    
//    var header: Header!
//    let validKty = "RSA"
//    let validTyp = "validTyp"
//    let validN = "modulus"
//    let validE = "AQAB"
//    let expectedHeader = JWTHeader(fields: ["jwk": JWTKit.JWTHeaderField.object(["n": JWTKit.JWTHeaderField.string("modulus"), "kty": JWTKit.JWTHeaderField.string("RSA"), "e": JWTKit.JWTHeaderField.string("AQAB")]), "typ": JWTKit.JWTHeaderField.string("validTyp")])
//
//    
//    override func setUp() {
//        super.setUp()
//        do {
//            header = try Header(kty: validKty, typ: validTyp, n: validN, e: validE)
//        } catch {
//        }
//    }
//    
//    override func tearDown() {
//        header = nil
//        super.tearDown()
//    }
//    
//    func testGetHeaderSuccess() {
//        let jwtHeader = header.getHeader()
//        XCTAssertEqual(jwtHeader.alg, expectedHeader.alg)
//        XCTAssertEqual(jwtHeader.typ, expectedHeader.typ)
//        XCTAssertEqual(jwtHeader.jwk, expectedHeader.jwk)
//    }
//    
//    func testHeaderInitializationFailureWithInvalidParameters() {
//        XCTAssertThrowsError(try Header(kty: "", typ: "", n: "", e: ""))
//    }
//    
//}
