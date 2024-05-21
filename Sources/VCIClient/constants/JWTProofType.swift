import Foundation

public enum JWTProofType: String {
    case TYPE = "openid4vci-proof+jwt"
    
    enum Algorithms: String {
        case RSA
    }
}
