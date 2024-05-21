
import Security
import Foundation

func generateKeyPair() -> (publicKey: Data, privateKey: Data)? {
    var publicKeyyyy, privateKeyyyy: SecKey?
    
    let parameters: [String: Any] = [
        kSecAttrKeyType as String: kSecAttrKeyTypeRSA,
        kSecAttrKeySizeInBits as String: 2048
    ]
    guard SecKeyGeneratePair(parameters as CFDictionary, &publicKeyyyy, &privateKeyyyy) == errSecSuccess else {
        print("Failed to generate key pair")
        return nil
    }
    
    guard let publicKeyData = SecKeyCopyExternalRepresentation(publicKeyyyy!, nil) as Data?,
          let privateKeyData = SecKeyCopyExternalRepresentation(privateKeyyyy!, nil) as Data? else {
        print("Failed to retrieve key data")
        return nil
    }
    
    return (publicKeyData, privateKeyData)
}
