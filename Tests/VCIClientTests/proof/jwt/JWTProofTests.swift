import XCTest
@testable import VCIClient

class JWTProofTests: XCTestCase {
    
 
    func testJWTProofInitializationSuccess() {
        let jwtToken = "xx.xx.xxx"
        let jwtProof = JWTProof(jwt: jwtToken)
        
        XCTAssertNotNil(jwtProof)
        XCTAssertEqual(jwtProof.proof_type, "jwt")
        XCTAssertEqual(jwtProof.jwt, jwtToken)
    }
    
    func testJWTProofEncodingToJSONSuccess() {
        let jwtToken = "xxx.xx.xxx"
        let jwtProof = JWTProof(jwt: jwtToken)
        let encoder = JSONEncoder()
        
        do {
            let jsonData = try encoder.encode(jwtProof)
            let jsonString = String(data: jsonData, encoding: .utf8)
            
            XCTAssertNotNil(jsonString)
            XCTAssertTrue(jsonString?.contains("\"proof_type\":\"jwt\"") ?? false)
            XCTAssertTrue(jsonString?.contains("\"jwt\":\"\(jwtToken)\"") ?? false)
        } catch {
            XCTFail("Encoding to JSON failed with error: \(error)")
        }
    }
}
