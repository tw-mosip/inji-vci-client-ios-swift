import Foundation

struct VC: Codable, CredentialResponse{
    let format: String
    let credential: Credential
    
    func toJSONString() throws -> String {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let data = try encoder.encode(self)
        guard let jsonString = String(data: data, encoding: .utf8) else {
            throw DownloadFailedError.encodingResponseFailed
        }
        return jsonString
    }
}


struct Credential: Codable , CredentialResponse{
    let issuanceDate: String
    let credentialSubject: CredentialSubject
    let id: String
    let proof: ProofResponse
    let type: [String]
    let context: [ContextType]?
    let issuer: String
    
    enum CodingKeys: String, CodingKey {
        case issuanceDate, credentialSubject, id, proof, type
        case context = "@context"
        case issuer
    }
    
    func toJSONString() throws -> String {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let data = try encoder.encode(self)
        guard let jsonString = String(data: data, encoding: .utf8) else {
        throw DownloadFailedError.encodingResponseFailed
        }
    return jsonString
    }
    
    init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            issuanceDate = try container.decode(String.self, forKey: .issuanceDate)
            credentialSubject = try container.decode(CredentialSubject.self, forKey: .credentialSubject)
            id = try container.decode(String.self, forKey: .id)
            proof = try container.decode(ProofResponse.self, forKey: .proof)
            type = try container.decode([String].self, forKey: .type)
            context = try container.decodeIfPresent([ContextType].self, forKey: .context)
            issuer = try container.decode(String.self, forKey: .issuer)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(issuanceDate, forKey: .issuanceDate)
            try container.encode(credentialSubject, forKey: .credentialSubject)
            try container.encode(id, forKey: .id)
            try container.encode(proof, forKey: .proof)
            try container.encode(type, forKey: .type)
            try container.encode(context, forKey: .context)
            try container.encode(issuer, forKey: .issuer)
        }
}

enum ContextType: Codable {
    case string(String)
    case dictionary([String: String])
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let string = try? container.decode(String.self) {
            self = .string(string)
        } else if let dictionary = try? container.decode([String: String].self) {
            self = .dictionary(dictionary)
        } else {
            throw DownloadFailedError.encodingResponseFailed
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
            case .string(let value):
                try container.encode(value)
            case .dictionary(let value):
                try container.encode(value)
        }
    }
}

struct CredentialSubject: Codable {
    let gender: [Gender]
    let phone: String
    let city: [City]
    let id: String
    let dateOfBirth: String
    let fullName: [FullName]
    let face: String
    let addressLine1: [AddressLine1]
    let email: String
    let UIN: String
    
    
    enum CodingKeys: String, CodingKey {
        case face, gender, phone, city, fullName, addressLine1, dateOfBirth, id, UIN, email
    }
}

struct Gender: Codable {
    let language: String
    let value: String
}

struct City: Codable {
    let language: String
    let value: String
}

struct FullName: Codable {
    let language: String
    let value: String
}

struct AddressLine1: Codable {
    let language: String
    let value: String
}

struct ProofResponse: Codable {
    let proofPurpose: String
    let created: String
    let jws: String
    let verificationMethod: String
    let type: String
    enum CodingKeys: String, CodingKey {
        case type, created, proofPurpose, verificationMethod, jws
    }
}

