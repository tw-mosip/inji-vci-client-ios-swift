//import Foundation
//import JWTKit
//
//class JWTProof{
//    
//    var publicKey: String
//    var issuerMeta: IssuerMeta
//    var signer: (JWTPayload, JWTHeader) async throws -> String
//    var accessToken: String
//    
//    init(publicKey: String, issuerMeta: IssuerMeta, 
//         signer: @escaping (JWTPayload, JWTHeader) async throws -> String, accessToken: String) {
//        self.publicKey = publicKey
//        self.issuerMeta = issuerMeta
//        self.signer = signer
//        self.accessToken = accessToken
//    }
//    
//    func getJWT() async throws -> String{
//        let logTag = Util.getLogTag(className: String(describing: type(of: self)))
//        do{
//            let (modulus, exponent) = try KeyConversion(publicKey: self.publicKey).getRSAPublicKey()
//            
//            let header = try Header(kty: JWTProofType.Algorithms.RSA.rawValue, typ: JWTProofType.TYPE.rawValue, n: modulus, e: exponent).getHeader()
//            
//            let decodedAccessToken = try decodeToken(accessToken: accessToken)
//            
//            let payload = try Payload(issuer: issuerMeta, jwtBody: decodedAccessToken).getPayload()
//            
//            
//            let signedValue = try await signer(payload, header)
//            return signedValue
//        }
//        catch{
//            print(logTag, "Error while parsing access token - \(error)")
//            throw error
//        }
//    }
//}
