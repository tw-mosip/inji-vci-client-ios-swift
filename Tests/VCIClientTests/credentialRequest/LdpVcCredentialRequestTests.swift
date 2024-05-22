import XCTest
@testable import VCIClient

class LdpVcCredentialRequestTests: XCTestCase {
    
    var credentialRequest: LdpVcCredentialRequest!
    
    override func setUp() {
        super.setUp()
        credentialRequest = LdpVcCredentialRequest()
    }
    
    override func tearDown() {
        credentialRequest = nil
        super.tearDown()
    }
    
    func testConstructRequestSuccess() {
        let url = URL(string: "https://example.com")!
        let accessToken = "AccessToken"
        let issuer = IssuerMeta(credentialAudience: "https://domain.net",
                                credentialEndpoint: "https://domain.net/credential",
                                downloadTimeoutInMilliseconds: 20000,
                                credentialType: ["VerifiableCredential"],
                                credentialFormat: .ldp_vc)
        let proofJWT = JWTProof(jwt: "ProofJWT")
        
        do {
            let request = try credentialRequest.constructRequest(url: url, credentialFormat: .ldp_vc, accessToken: accessToken, issuer: issuer, proofJwt: proofJWT)
            XCTAssertEqual(request.url, url)
            XCTAssertEqual(request.httpMethod, "POST")
            XCTAssertEqual(request.allHTTPHeaderFields?["Content-Type"], "application/json")
            XCTAssertEqual(request.allHTTPHeaderFields?["Authorization"], "Bearer \(accessToken)")
            XCTAssertEqual(request.timeoutInterval, TimeInterval(issuer.downloadTimeoutInMilliseconds / 1000))
            XCTAssertNotNil(request.httpBody)
        } catch {
            XCTFail("Error: \(error.localizedDescription)")
        }
    }
    
    func testGenerateRequestBodySuccess() {
        let proofJWT = JWTProof(jwt: "xxxx.yyyy.zzzz")
        let issuer = IssuerMeta(credentialAudience: "https://domain.net",
                                credentialEndpoint: "https://domain.net/credential",
                                downloadTimeoutInMilliseconds: 20000,
                                credentialType: ["VerifiableCredential"],
                                credentialFormat: .ldp_vc)
        
        do {
            let jsonData = try credentialRequest.generateRequestBody(proofJWT: proofJWT, issuer: issuer)
            XCTAssertNotNil(jsonData)
        } catch {
            XCTFail("Error: \(error.localizedDescription)")
        }
    }

    func testCredentialDefinitionInitializationSuccess() {
        let credentialDefinition = CredentialDefinition(type: ["Type"])
        XCTAssertEqual(credentialDefinition.context, ["https://www.w3.org/2018/credentials/v1"])
        XCTAssertEqual(credentialDefinition.type, ["Type"])
    }
}
