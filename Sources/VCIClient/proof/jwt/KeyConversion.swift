import Foundation
import JWTKit

class KeyConversion {
    var publicKey: String
    
    init(publicKey: String) {
        self.publicKey = publicKey
    }
    
    func getRSAPublicKey() throws -> (String, String) {
        do {
            let publicKeyRSA = try Insecure.RSA.PublicKey(pem: self.publicKey)
            let (modulus, exponent) = try publicKeyRSA.getKeyPrimitives()
            return (modulus, exponent)
        } catch {
            throw InvalidPublicKeyError.keyPrimitiveExtractionFailed
        }
    }
}
