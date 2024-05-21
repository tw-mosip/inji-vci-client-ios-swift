import Foundation

enum InvalidPublicKeyError: Error{
    case invalidInput
    case invalidKeys
    case keyPrimitiveExtractionFailed
    case customError(description: String) 
}
