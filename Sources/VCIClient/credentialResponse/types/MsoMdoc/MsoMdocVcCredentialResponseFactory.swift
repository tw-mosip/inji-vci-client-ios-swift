import Foundation

class MsoMdocCredentialResponseFactory: CredentialResponseFactoryProtocol {
    func constructResponse(response: Data) throws -> CredentialResponse? {
        let logTag = Util.getLogTag(className: String(describing: type(of: self)))
        do{
            let decodedCredentialResponse = try JSONDecoder().decode(MsoMdocVcResponse.self, from: response)
            let result = try? CborLibrayUtils().decodeAndParseMdoc(base64EncodedString: decodedCredentialResponse.credential)
            
            let vc = MsoMdocCredential(credential: Util.convertToAnyCodable(dict: result ?? [String:AnyCodable]()))
            return vc
        }
        catch{
            print(logTag,"error occurred while parsing mso_mdoc data")
            throw DownloadFailedError.decodingResponseFailed
        }
    }
}


internal struct MsoMdocVcResponse : Codable {
    var credential: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        credential = try container.decode(String.self, forKey: .credential)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(credential, forKey: .credential)
    }
    
    enum CodingKeys: String, CodingKey {
        case credential
    }
}