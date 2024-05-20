import Foundation

public enum DownloadFailedError: Error {
    case invalidURL
    case requestGenerationFailed
    case httpError(statusCode: Int, description: String)
    case requestBodyEncodingFailed
    case noResponse
    case decodingResponseFailed
    case encodingResponseFailed
    case customError(description: String) 
}
