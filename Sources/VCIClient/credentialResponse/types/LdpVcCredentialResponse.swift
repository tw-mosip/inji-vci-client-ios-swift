import Foundation

struct VC: Codable{
    let format: String
    let credential: Credential
}

struct Credential: Codable , CredentialResponse{
    let issuer: String
    let issuanceDate: String
    let id: String
    let proof: ProofResponse
    let credentialSubject: CredentialSubject
    let type: [String]
    let contextArray: [String]?
    let contextDict: [String: String]?

    enum CodingKeys: String, CodingKey {
        case credentialSubject, id, proof, type, issuer, issuanceDate
        case contextArray = "@context"
        case contextDict
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        issuer = try values.decode(String.self, forKey: .issuer)
        issuanceDate = try values.decode(String.self, forKey: .issuanceDate)
        credentialSubject = try values.decode(CredentialSubject.self, forKey: .credentialSubject)
        id = try values.decode(String.self, forKey: .id)
        proof = try values.decode(ProofResponse.self, forKey: .proof)
        type = try values.decode([String].self, forKey: .type)
        contextArray = try? values.decode([String].self, forKey: .contextArray)
        contextDict = try? values.decode([String: String].self, forKey: .contextArray)
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

