//import XCTest
//import JWTKit
//@testable import VCIClient
//
//class PayloadTests: XCTestCase {
//    
//    var payload: Payload!
//    var jwtBody: [String:Any]!
//    let accessToken = "eyJraWQiOiJIb0tLSFRZc1FUNEpTMWs2MXlpZXlEVmJBcG5qMVFEamVpak91ZDMzRkU4IiwiYWxnIjoiUlMyNTYifQ.eyJzdWIiOiIyNzg2MTE5OTAyNDU5NTk1MjU1MDgzOTYxNDI1ODg5ODU3MzIiLCJhdWQiOiJodHRwczpcL1wvZXNpZ25ldC5xYS1pbmppLm1vc2lwLm5ldFwvdjFcL2VzaWduZXRcL3ZjaVwvY3JlZGVudGlhbCIsImNfbm9uY2VfZXhwaXJlc19pbiI6NDAsImNfbm9uY2UiOiJsRENCekNQYWRqNEpURVhPQU1XQSIsInNjb3BlIjoibW9zaXBfaWRlbnRpdHlfdmNfbGRwIiwiaXNzIjoiaHR0cHM6XC9cL2VzaWduZXQucWEtaW5qaS5tb3NpcC5uZXRcL3YxXC9lc2lnbmV0IiwiZXhwIjoxNzE1Njg1NjI2LCJpYXQiOjE3MTU2ODIwMjYsImNsaWVudF9pZCI6Ilo4TEpfcDBsa2gwYVMzcTZDTUdkcnJYdDItOU1IdkdEOVM4QllWbzlCdzAifQ.soopHBmDKG-v3K4UTxDkz4imXI2gN6bSzA7OcOXoGHpYtAbOQZ9RmSxBkmIRJuJyRJyJwsWS0Q_AvlWPV_ETS0dbecBUvdvklUNJM7zcZ8wP8y1YtHGRxxgE6I0XepOLn9v3uYRh52EivI4znTkontet7v4MbMmBb8IEPc7P-LvITIe5-uwNPi07vj_zzIHeGUBnHt-85MjOC-kxuhxfrcwHDRb0yaG7AhYM4C_Cddwc6mOCEWLQup0gI2jHcQe-f4GcXaT9Bl4ctD8A-wnXHT0rMsijfdGFnTN2MncrQqmXgkc0-Ao3G4S8yp9S8UbgO1eqygvt-abHtZ0Kx3K2WA"
//    let validIssuer = IssuerMeta(credentialAudience: "https://domain.net", credentialEndpoint: "https://esignet.qa-inji.mosip.net/v1/esignet/vci/credential", downloadTimeoutInMilliseconds: 20000, credentialType: ["VerifiableCredential","MOSIPVerifiableCredential"] , credentialFormat: CredentialFormat.ldp_vc)
//    
//    var expectedPayload = JwtPayload(iss: "Z8LJ_p0lkh0aS3q6CMGdrrXt2-9MHvGD9S8BYVo9Bw0", nonce: "lDCBzCPadj4JTEXOAMWA", aud: "https://domain.net", iat: IssuedAtClaim(value: Date()), exp: ExpirationClaim(value: Date()))
//    
//    override func setUp() {
//        super.setUp()
//        jwtBody = try! decodeToken(accessToken: accessToken)
//        payload = try! Payload(issuer: validIssuer, jwtBody: jwtBody)
//    }
//    
//    override func tearDown() {
//        payload = nil
//        super.tearDown()
//    }
//    
//    func testGetPayloadSuccess() {
//        do {
//            let payload = try payload.getPayload()
//            XCTAssertEqual(payload as! JwtPayload, expectedPayload)
//        } catch {
//            XCTFail("Failed to get JWT payload: \(error)")
//        }
//    }
//}
