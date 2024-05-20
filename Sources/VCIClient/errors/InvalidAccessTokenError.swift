import Foundation

enum InvalidAccessTokenError: Error{
    case invalidAccessToken
    case decodingFailed
    case missingClientID
    case missingNonce
    case customError(description: String) 
}
