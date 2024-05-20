import Foundation

struct CredentialRequestBody: Codable {
    let format: CredentialFormat
    let credential_definition: CredentialDefinition
    let proof: RequestProof
}

struct CredentialDefinition: Codable {
    let context: [String]?
    let type: [String]

    private enum CodingKeys: String, CodingKey {
        case context = "@context"
        case type
    }

    init(context: [String]? = ["https://www.w3.org/2018/credentials/v1"], type: [String]) {
        self.context = context
        self.type = type
    }

}
struct RequestProof: Codable {
    let proof_type: String?
    let jwt: String
    
    init(proof_type: String? = ProofType.JWT.rawValue, jwt: String) {
        self.proof_type = proof_type
        self.jwt = jwt
    }
    
    func toJson() -> String? {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        do {
            let jsonData = try encoder.encode(self)
            return String(data: jsonData, encoding: .utf8)
        } catch {
            return nil
        }
    }
}
