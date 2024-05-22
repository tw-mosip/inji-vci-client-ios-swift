//import XCTest
//import JWTKit
//@testable import VCIClient
//
//class JWTProofTests: XCTestCase {
//    
//    let issuerMeta = IssuerMeta(credentialAudience: "https://esignet.qa-inji.mosip.net", credentialEndpoint: "https://esignet.qa-inji.mosip.net/v1/esignet/vci/credential", downloadTimeoutInMilliseconds: 20000, credentialType: ["VerifiableCredential","MOSIPVerifiableCredential"] , credentialFormat: CredentialFormat.ldp_vc)
//    let accessToken = "eyJraWQiOiJIb0tLSFRZc1FUNEpTMWs2MXlpZXlEVmJBcG5qMVFEamVpak91ZDMzRkU4IiwiYWxnIjoiUlMyNTYifQ.eyJzdWIiOiIyNzg2MTE5OTAyNDU5NTk1MjU1MDgzOTYxNDI1ODg5ODU3MzIiLCJhdWQiOiJodHRwczpcL1wvZXNpZ25ldC5xYS1pbmppLm1vc2lwLm5ldFwvdjFcL2VzaWduZXRcL3ZjaVwvY3JlZGVudGlhbCIsImNfbm9uY2VfZXhwaXJlc19pbiI6NDAsImNfbm9uY2UiOiJXOURiZHRQVUc3UkY2cGlydlBhMSIsInNjb3BlIjoibW9zaXBfaWRlbnRpdHlfdmNfbGRwIiwiaXNzIjoiaHR0cHM6XC9cL2VzaWduZXQucWEtaW5qaS5tb3NpcC5uZXRcL3YxXC9lc2lnbmV0IiwiZXhwIjoxNzE1Njg1MDAwLCJpYXQiOjE3MTU2ODE0MDAsImNsaWVudF9pZCI6Ilo4TEpfcDBsa2gwYVMzcTZDTUdkcnJYdDItOU1IdkdEOVM4QllWbzlCdzAifQ.oCgKLm1fOAGn_AkwnwR8f87aRoXa1WPxJwH0_WMFJIsCiimWWGfSTXXvU8cPGBjBZA8eGBfwF6QWzVx7YsFZZzh4cMODQuTqvkjtSsd0ymlHLjte-e-HgOahKaP9OuaKxfvS0G4hg2sbyHVB3oInMamaaqDK0i1b0iK_33dGns67bIz1Yu4n2Oml_I-YHVr82X1FdkgDEXv-JulSXWz5IXt4pdwWKyf9-Yi5wfB-c4yOiwpLiY8gP5igmEbFrStY9UUkE9dkFIJv4-qdg6_dMGnCAoJRUmwWbhojg6_nFLhe1hRXw7473Hjv9ilOWGldcUATpqDsRnUCWDWY6N96ug"
//    
//    
//    func testGetJWTSuccess() async {
//        let jwtProof = JWTProof(publicKey: publicKey, issuerMeta: issuerMeta, signer: signer, accessToken: accessToken)
//        do {
//            let jwt = try await jwtProof.getJWT()
//            let jwtComponents = jwt.split(separator: ".").count
//            XCTAssertEqual(jwtComponents, 3)
//        }
//        catch{}
//    }
//}
