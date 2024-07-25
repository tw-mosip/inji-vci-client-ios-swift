import Foundation

protocol CredentialResponseFactoryProtocol {
    static func createCredentialResponse(formatType: CredentialFormat, response: Data) throws -> CredentialResponse?
    func constructResponse(response: Data) throws -> CredentialResponse?
}

extension CredentialResponseFactoryProtocol{
    static func createCredentialResponse(formatType: CredentialFormat, response: Data) throws -> CredentialResponse? {
        switch formatType{
        case .ldp_vc:
            return try LdpVcCredentialResponseFactory().constructResponse(response: response)
        case .mso_mdoc:
            return try LdpVcCredentialResponseFactory().constructResponse(response: response)
        }
    }
}

class CredentialResponseFactory: CredentialResponseFactoryProtocol{
    func constructResponse(response: Data) -> CredentialResponse? {
        return nil
    }
}
