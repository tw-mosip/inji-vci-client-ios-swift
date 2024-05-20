import Foundation

class LdpVcCredentialRequest{
    
    func constructRequest(url: URL,
                                credentialFormat: CredentialFormat,
                                accessToken: String,
                                issuer: IssuerMeta,
                                proofJwt: String) throws -> URLRequest{
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        request.timeoutInterval = TimeInterval(issuer.downloadTimeoutInMilliseconds / 1000)
        
        guard let requestBody = try generateRequestBody(proofJWT: proofJwt, issuer: issuer) else {
            throw DownloadFailedError.requestGenerationFailed
        }

        request.httpBody = requestBody

        return request
    }
    
    func generateRequestBody(proofJWT: String, issuer: IssuerMeta) throws -> Data? {
        let proof = RequestProof(jwt: proofJWT)
        let credentialDefinition = CredentialDefinition(type: issuer.credentialType)

        let credentialRequestBody = CredentialRequestBody(
            format: issuer.credentialFormat,
            credential_definition: credentialDefinition,
            proof: proof
        )
        
        do {
            let jsonData = try JSONEncoder().encode(credentialRequestBody)
            return jsonData
        } catch {
            throw DownloadFailedError.requestBodyEncodingFailed
        }
    }
}
