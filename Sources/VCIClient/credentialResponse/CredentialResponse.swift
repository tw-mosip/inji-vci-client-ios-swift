import Foundation

public protocol CredentialResponse{
    //TODO: toJSONString can be added as extension here
    func toJSONString() throws -> String
}
