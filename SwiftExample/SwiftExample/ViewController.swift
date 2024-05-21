import UIKit
import VCIClient
import AppAuth
import JWTKit

class ViewController: UIViewController {
    var myAccessToken: String = ""
    
    @IBAction func getKeys(_ sender: UIButton) {
                
        if let keyPair = generateKeyPair() {
            let publicKeyPEM = "-----BEGIN PUBLIC KEY-----\n" + keyPair.publicKey.base64EncodedString() + "\n-----END PUBLIC KEY-----"
            let privateKeyPEM = "-----BEGIN PRIVATE KEY-----\n" + keyPair.privateKey.base64EncodedString() + "\n-----END PRIVATE KEY-----"
            myPubKey = publicKeyPEM
            myPriKey = privateKeyPEM
        
            print("Public Key:\n\(publicKeyPEM)")
            print("\nPrivate Key:\n\(privateKeyPEM)")
        }
    }
    
    @IBAction func getAccessTokenFromIssuer(_ sender: UIButton) {
        authenticateWithIssuer()
    }
    
    @IBAction func getCredentialFromLib(_ sender: UIButton) {
        Task {
            do {
                if let requestCredential = try await VCIClient(traceabilityId: "My swift app").requestCredential(issuerMeta: issuer, signer: signer, accessToken: myAccessToken, publicKey: publicKey) {
                    showAlertMessage(title: "Success..!!", message: "Credentials have been downloaded")
                    print("VC downloaded ", requestCredential)
                }
            } catch {
                showAlertMessage(title: "Error", message: error.localizedDescription)
                print("An error occurred:", error.localizedDescription)
            }
        }
    }


    @objc func authenticateWithIssuer() {
        AuthHandler.authenticateWithIssuer(viewController: self)
    }

    func setAuthState(_ authState: OIDAuthState?) {
        myAccessToken = authState?.lastTokenResponse?.accessToken ?? "nil"
    }
}

