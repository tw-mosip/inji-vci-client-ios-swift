import Foundation

public struct IssuerMeta {
    public let credentialAudience: String //
    public let credentialEndpoint: String //
    public let downloadTimeoutInMilliseconds: Int //
    public let credentialType: [String]? 
    public let credentialFormat: CredentialFormat //
    public let docType: String?
    public let claims: Claims?

    public init(credentialAudience: String ,
                credentialEndpoint: String,
                downloadTimeoutInMilliseconds: Int,
                credentialType: [String], 
                credentialFormat: CredentialFormat,
                docType: String? = nil,
                claims: Claims? = nil) {
        self.credentialAudience = credentialAudience
        self.credentialEndpoint = credentialEndpoint
        self.downloadTimeoutInMilliseconds = downloadTimeoutInMilliseconds
        self.credentialType = credentialType
        self.credentialFormat = credentialFormat
        self.docType = docType
        self.claims = claims
    }
}

public struct Claims {
    public let iso1801351: [String: Any]?
    public let iso1801351Aamva: [String: Any]?
    
    public init(iso1801351: [String: Any]?, iso1801351Aamva: [String: Any]?) {
        self.iso1801351 = iso1801351
        self.iso1801351Aamva = iso1801351Aamva
    }
}

