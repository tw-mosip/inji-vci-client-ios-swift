import Foundation

class MsoMdocVcCredentialRequest {
    func constructRequest(url: URL,
                          credentialFormat: CredentialFormat,
                          accessToken: String,
                          issuer: IssuerMeta,
                          proofJwt: JWTProof) throws -> URLRequest {
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        let requestBody: [String: Any] = [
            "format": issuer.credentialFormat,
            "doctype": issuer.docType,
            "claims": issuer.claims,
            "proof": [
                "proof_type": proofJwt.proof_type,
                "jwt": proofJwt.jwt
            ]
        ]
        
        request.httpBody = try JSONSerialization.data(withJSONObject: requestBody, options: [])
        
        return request
    }
}
