import Foundation

class LdpVcCredentialResponseFactory: CredentialResponseFactoryProtocol {
    func constructResponse(response: Data) throws -> CredentialResponse? {
        do{
            let vc = try JSONDecoder().decode(VC.self, from: response)
            return vc.credential
        }
        catch{
            throw DownloadFailedError.decodingResponseFailed
        }
    }
}
