import Foundation
import VCIClient
import JWTKit

var issuer = IssuerMeta(credentialAudience: issuerCredentialAudience, credentialEndpoint: issuerCredentialEndPoint, downloadTimeoutInMilliseconds: issuerDownloadTimeout, credentialType: issuerCredentialType , credentialFormat: CredentialFormat.ldp_vc)

func signer(payload: JWTPayload, header: JWTHeader) async throws -> String {
    do {
        let keyCollection = try await JWTKeyCollection()
            .addRS256(key: Insecure.RSA.PrivateKey(pem: privateKey), kid: "private")
            .addRS256(key: Insecure.RSA.PublicKey(pem: publicKey), kid: "public")
        let privateSigned = try await keyCollection.sign(payload, header: header)
        return privateSigned
    } catch {
        throw error
    }
}
