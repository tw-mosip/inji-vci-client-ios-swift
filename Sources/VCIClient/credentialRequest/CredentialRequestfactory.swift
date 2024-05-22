import Foundation

class CredentialRequestfactory{
    static func createCredentialRequest(url: URL,
                                        credentialFormat: CredentialFormat,
                                        accessToken: String,
                                        issuer: IssuerMeta,
                                        proofJwt: Proof) -> URLRequest {
        switch credentialFormat{
        case .ldp_vc: try! LdpVcCredentialRequest().constructRequest(url: url,
                                                credentialFormat: credentialFormat,
                                                accessToken: accessToken,
                                                issuer: issuer,
                                                proofJwt: proofJwt as! JWTProof )
        }
    }
}
