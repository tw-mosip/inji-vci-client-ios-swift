import Foundation

class MsoMdocCredentialResponseFactory: CredentialResponseFactoryProtocol {
    
    func constructResponse(response: Data) throws -> CredentialResponse? {
        do{
            let vc = try JSONDecoder().decode(AnyCodable.self, from: response)
            return vc
        }
        catch{
            throw DownloadFailedError.decodingResponseFailed
        }
    }

}
