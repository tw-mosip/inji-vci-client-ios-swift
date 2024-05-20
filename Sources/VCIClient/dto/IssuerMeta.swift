import Foundation

public struct IssuerMeta {
    public let credentialAudience: String
    public let credentialEndpoint: String
    public let downloadTimeoutInMilliseconds: Int
    public let credentialType: [String]
    public let credentialFormat: CredentialFormat

    public init(credentialAudience: String, credentialEndpoint: String, downloadTimeoutInMilliseconds: Int, credentialType: [String], credentialFormat: CredentialFormat) {
        self.credentialAudience = credentialAudience
        self.credentialEndpoint = credentialEndpoint
        self.downloadTimeoutInMilliseconds = downloadTimeoutInMilliseconds
        self.credentialType = credentialType
        self.credentialFormat = credentialFormat
    }
}



