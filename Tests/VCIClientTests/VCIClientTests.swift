//import XCTest
//import JWTKit
//@testable import VCIClient
//
//class VCIClientTests: XCTestCase {
//    
//    var client: VCIClient!
//    var mockSession: MockNetworkSession!
//    
//    override func setUp() {
//        super.setUp()
//        mockSession = MockNetworkSession()
//        client = VCIClient(traceabilityId: "VCI-client-test", networkSession: mockSession)
//    }
//    
//    override func tearDown() {
//        mockSession = nil
//        client = nil
//        super.tearDown()
//    }
//    
//    func testGetCredentialSuccess() async {
//        let mockCredentialResponseData = """
//        {
//          "format": "ldp_vc",
//          "credential": {
//            "issuer": "https://domain.net/credentials/",
//            "issuanceDate": "2024-05-12T16:12:47.266Z",
//            "id": "https://domain.net/credentials/858c69d7-676a-4f19-ba51-d9ed754f2935",
//            "proof": {
//              "proofPurpose": "assertionMethod",
//              "created": "2024-05-12T16:12:47Z",
//              "jws": "eyJr80435=",
//              "verificationMethod": "https://domain.net/.well-known/ida-public-key.json",
//              "type": "RsaSignature2018"
//            },
//            "credentialSubject": {
//              "gender": [
//                {
//                  "value": "Male",
//                  "language": "eng"
//                }
//              ],
//              "phone": "9876567893",
//              "city": [
//                {
//                  "value": "Kenitra",
//                  "language": "eng"
//                }
//              ],
//              "id": "did:jwk:eyJrdHkiOi==",
//              "dateOfBirth": "1999/01/01",
//              "fullName": [
//                {
//                  "value": "santhush",
//                  "language": "eng"
//                }
//              ],
//              "face": "daVqaL0H1oorC",
//              "addressLine1": [
//                {
//                  "value": "saravangar",
//                  "language": "eng"
//                }
//              ],
//              "email": "sunthoush@gmail.com",
//              "UIN": "9612973623"
//            },
//            "type": [
//              "VerifiableCredential",
//              "MOSIPVerifiableCredential"
//            ],
//            "@context": [
//              "https://www.domain.org/2018/credentials/v1",
//              "https://api.domain.net/.well-known/domain-context.json",
//              {
//                "sec": "https://w3id.org/security#"
//              }
//            ]
//          }
//        }
//        """.data(using: .utf8)!
//        let mockCredentialResponse = HTTPURLResponse(url: URL(string: "https://domain.net/credentials/12345-87435")!,
//                                                     statusCode: 200,
//                                                     httpVersion: "1.1",
//                                                     headerFields: ["Content-Type": "application/json"])!
//        
//        
//        mockSession.data = mockCredentialResponseData
//        mockSession.response = mockCredentialResponse
//        
//        let issuerMeta = IssuerMeta(credentialAudience: "https://domain.net",
//                                    credentialEndpoint: "https://domain.net/credential",
//                                    downloadTimeoutInMilliseconds: 20000,
//                                    credentialType: ["VerifiableCredential"],
//                                    credentialFormat: .ldp_vc)
//        let accessToken = "eyJraWQiOiJIb0tLSFRZc1FUNEpTMWs2MXlpZXlEVmJBcG5qMVFEamVpak91ZDMzRkU4IiwiYWxnIjoiUlMyNTYifQ.eyJzdWIiOiIyNzg2MTE5OTAyNDU5NTk1MjU1MDgzOTYxNDI1ODg5ODU3MzIiLCJhdWQiOiJodHRwczpcL1wvZXNpZ25ldC5xYS1pbmppLm1vc2lwLm5ldFwvdjFcL2VzaWduZXRcL3ZjaVwvY3JlZGVudGlhbCIsImNfbm9uY2VfZXhwaXJlc19pbiI6NDAsImNfbm9uY2UiOiJsRENCekNQYWRqNEpURVhPQU1XQSIsInNjb3BlIjoibW9zaXBfaWRlbnRpdHlfdmNfbGRwIiwiaXNzIjoiaHR0cHM6XC9cL2VzaWduZXQucWEtaW5qaS5tb3NpcC5uZXRcL3YxXC9lc2lnbmV0IiwiZXhwIjoxNzE1Njg1NjI2LCJpYXQiOjE3MTU2ODIwMjYsImNsaWVudF9pZCI6Ilo4TEpfcDBsa2gwYVMzcTZDTUdkcnJYdDItOU1IdkdEOVM4QllWbzlCdzAifQ.soopHBmDKG-v3K4UTxDkz4imXI2gN6bSzA7OcOXoGHpYtAbOQZ9RmSxBkmIRJuJyRJyJwsWS0Q_AvlWPV_ETS0dbecBUvdvklUNJM7zcZ8wP8y1YtHGRxxgE6I0XepOLn9v3uYRh52EivI4znTkontet7v4MbMmBb8IEPc7P-LvITIe5-uwNPi07vj_zzIHeGUBnHt-85MjOC-kxuhxfrcwHDRb0yaG7AhYM4C_Cddwc6mOCEWLQup0gI2jHcQe-f4GcXaT9Bl4ctD8A-wnXHT0rMsijfdGFnTN2MncrQqmXgkc0-Ao3G4S8yp9S8UbgO1eqygvt-abHtZ0Kx3K2WA"
//        let publicKey = publicKey
//        let proofJWT = "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiYWRtaW4iOnRydWUsImlhdCI6MTUxNjIzOTAyMn0.NHVaYe26MbtOYhSKkoKYdFVomg4i8ZJd8_-RU8VNbftc4TSMb4bXP3l3YlNWACwyXPGffz5aXHc6lty1Y2t4SWRqGteragsVdZufDn5BlnJl9pdR_kdVFUsra2rWKEofkZeIC4yWytE58sMIihvo9H1ScmmVwBcQP6XETqYd0aSHp1gOa9RdUPDvoXQ5oqygTqVtxaDr6wUFKrKItgBMzWIdNZ6y7O9E0DhEPTbE9rfBo6KTFsHAZnMg4k68CDp2woYIaXbmYTWcvbzIuHO7_37GT79XdIwkm95QJ7hYC9RiwrV7mesbY4PAahERJawntho0my942XheVLmGwLMBkQ"
//        
//        do {
//            let response = try await client.requestCredential(issuerMeta: issuerMeta,
//                                                    signer: { payload, header in return proofJWT },
//                                                    accessToken: accessToken,
//                                                    publicKey: publicKey)
//            XCTAssertNotNil(response)
//        } catch {
//            XCTFail("Unexpected error: \(error)")
//        }
//    }
//    
//    
//    func testGetCredentialFailure() async {
//        let mockErrorResponseData = """
//        {
//            "error": "InvalidPublicKeyError",
//            "message": "keyPrimitiveExtractionFailed"
//        }
//        """.data(using: .utf8)!
//        let mockErrorResponse = HTTPURLResponse(url: URL(string: "https://domain.net/credentials/12345-87435")!,
//                                                statusCode: 401,
//                                                httpVersion: "1.1",
//                                                headerFields: ["Content-Type": "application/json"])!
//        
//        mockSession.data = mockErrorResponseData
//        mockSession.response = mockErrorResponse
//        
//        let issuerMeta = IssuerMeta(credentialAudience: "https://domain.net",
//                                    credentialEndpoint: "https://domain.net/credential",
//                                    downloadTimeoutInMilliseconds: 20000,
//                                    credentialType: ["VerifiableCredential"],
//                                    credentialFormat: .ldp_vc)
//        let accessToken = "eyJraWQiOiJIb0tLSFRZc1FUNEpTMWs2MXlpZXlEVmJBcG5qMVFEamVpak91ZDMzRkU4IiwiYWxnIjoiUlMyNTYifQ.eyJzdWIiOiIyNzg2MTE5OTAyNDU5NTk1MjU1MDgzOTYxNDI1ODg5ODU3MzIiLCJhdWQiOiJodHRwczpcL1wvZXNpZ25ldC5xYS1pbmppLm1vc2lwLm5ldFwvdjFcL2VzaWduZXRcL3ZjaVwvY3JlZGVudGlhbCIsImNfbm9uY2VfZXhwaXJlc19pbiI6NDAsImNfbm9uY2UiOiJsRENCekNQYWRqNEpURVhPQU1XQSIsInNjb3BlIjoibW9zaXBfaWRlbnRpdHlfdmNfbGRwIiwiaXNzIjoiaHR0cHM6XC9cL2VzaWduZXQucWEtaW5qaS5tb3NpcC5uZXRcL3YxXC9lc2lnbmV0IiwiZXhwIjoxNzE1Njg1NjI2LCJpYXQiOjE3MTU2ODIwMjYsImNsaWVudF9pZCI6Ilo4TEpfcDBsa2gwYVMzcTZDTUdkcnJYdDItOU1IdkdEOVM4QllWbzlCdzAifQ.soopHBmDKG-v3K4UTxDkz4imXI2gN6bSzA7OcOXoGHpYtAbOQZ9RmSxBkmIRJuJyRJyJwsWS0Q_AvlWPV_ETS0dbecBUvdvklUNJM7zcZ8wP8y1YtHGRxxgE6I0XepOLn9v3uYRh52EivI4znTkontet7v4MbMmBb8IEPc7P-LvITIe5-uwNPi07vj_zzIHeGUBnHt-85MjOC-kxuhxfrcwHDRb0yaG7AhYM4C_Cddwc6mOCEWLQup0gI2jHcQe-f4GcXaT9Bl4ctD8A-wnXHT0rMsijfdGFnTN2MncrQqmXgkc0-Ao3G4S8yp9S8UbgO1eqygvt-abHtZ0Kx3K2WAqwerty"
//        let publicKey = "YourPublicKey"
//        let proofJWT = "YourProofJWT"
//        
//        do {
//            let _ = try await client.requestCredential(issuerMeta: issuerMeta,
//                                                    signer: { payload, header in return proofJWT },
//                                                    accessToken: accessToken,
//                                                    publicKey: publicKey)
//            
//            XCTFail("Expected an error but call succeeded")
//        } catch let error as NSError {
//            XCTAssertEqual(error.domain, "VCIClient.InvalidPublicKeyError")
//            
//        } catch {
//            XCTFail("Unexpected error: \(error)")
//        }
//    }
//}
