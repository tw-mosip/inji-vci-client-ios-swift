import Foundation

public class JWTProof: Proof, Codable{
    
    public var proof_type: String = ProofType.JWT.rawValue
    public var jwt: String
    
    public init(jwt: String){
        self.jwt = jwt
    }
}
