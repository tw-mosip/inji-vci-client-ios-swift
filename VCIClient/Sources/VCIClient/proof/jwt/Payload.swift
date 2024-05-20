import Foundation
import JWTKit
import JWTDecode

class Payload {
    var jwtBody: [String: Any] = [:]
    var issuer: IssuerMeta
    
    init(issuer: IssuerMeta, jwtBody: [String:Any]) throws {
        self.issuer = issuer
        self.jwtBody = jwtBody
    }
    
    func getPayload() throws -> JWTPayload {
        guard let clientID = jwtBody["client_id"] as? String else {
            throw InvalidAccessTokenError.missingClientID
        }
        guard let nonce = jwtBody["c_nonce"] as? String else {
            throw InvalidAccessTokenError.missingNonce
        }
        
        let payload = JwtPayload(
            iss: clientID,
            nonce: nonce,
            aud: issuer.credentialAudience,
            iat: IssuedAtClaim(value: Date()),
            exp: ExpirationClaim(value: Date().addingTimeInterval(36000))
        )
        return payload
    }
}

struct JwtPayload: JWTPayload {
    var iss: String
    var nonce: String
    var aud: String
    var iat: IssuedAtClaim
    var exp: ExpirationClaim
    
    func verify(using _: JWTAlgorithm) throws {
        try exp.verifyNotExpired()
    }
}

extension JwtPayload: Equatable {
    static func == (lhs: JwtPayload, rhs: JwtPayload) -> Bool {
        return lhs.iss == rhs.iss &&
            lhs.nonce == rhs.nonce &&
            lhs.aud == rhs.aud
    }
}

func decodeToken(accessToken: String) throws -> [String: Any] {
    do {
        let jwt = try decode(jwt: accessToken)
        return jwt.body
    } catch {
        throw InvalidAccessTokenError.decodingFailed
    }
}

