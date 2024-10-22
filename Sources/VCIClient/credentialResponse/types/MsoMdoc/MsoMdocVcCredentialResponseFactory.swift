import Foundation

class MsoMdocCredentialResponseFactory: CredentialResponseFactoryProtocol {
    func constructResponse(response: Data) throws -> CredentialResponse? {
        let logTag = Util.getLogTag(className: String(describing: type(of: self)))
        do{
            let vc = try JSONDecoder().decode(VC.self, from: response)
            return vc
        }
        catch let error {
            print(logTag,"error occurred while parsing mso_mdoc data - \(error.localizedDescription)")
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
