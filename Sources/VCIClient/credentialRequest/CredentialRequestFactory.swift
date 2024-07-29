import Foundation

public protocol CredentialRequestFactoryProtocol{
    func createCredentialRequest(url: URL,
                                 credentialFormat: CredentialFormat,
                                 accessToken: String,
                                 issuer: IssuerMeta,
                                 proofJwt: Proof) throws -> URLRequest
    
    func validateIssuerMeta(issuer: IssuerMeta) -> Bool
}

class CredentialRequestFactory: CredentialRequestFactoryProtocol{
    static let shared = CredentialRequestFactory()
    func createCredentialRequest(url: URL,
                                 credentialFormat: CredentialFormat,
                                 accessToken: String,
                                 issuer: IssuerMeta,
                                 proofJwt: Proof) throws -> URLRequest {
        switch credentialFormat{
        case .ldp_vc:
            return try LdpVcCredentialRequest().constructRequest(url: url,
                                                                 credentialFormat: credentialFormat,
                                                                 accessToken: accessToken,
                                                                 issuer: issuer,
                                                                 proofJwt: proofJwt as? JWTProof ?? JWTProof(jwt: ""))
        case .mso_mdoc:
            return try MsoMdocVcCredentialRequest().constructRequest(url: url,
                                                                 credentialFormat: credentialFormat,
                                                                 accessToken: accessToken,
                                                                 issuer: issuer,
                                                                 proofJwt: proofJwt as? JWTProof ?? JWTProof(jwt: ""))
            
        }
    }
    
    func validateIssuerMeta(issuer: IssuerMeta) -> Bool {
        switch issuer.credentialFormat{
        case .ldp_vc: return issuer.credentialType != nil
        case .mso_mdoc: return (issuer.claims != nil && issuer.docType != nil)
            
        }
    }
}
