import XCTest
@testable import VCIClient

class KeyConversionTests: XCTestCase {
    
    var keyConversion: KeyConversion!
    let validPublicKey = """
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAy/FtQ/cOcx6ZgyaqU54C
ESfkpttXuNnEZ07nYXXo8ylIiUFpB0r0Fecgv/tIhF1LFCWBHUsqyoSRQz0/iBRn
YyIsG+yF/q1K3ll5Q/2GAS9/28jBuJGKDuKIj6dgPlr33si6bjeePTl4ZO6OZFxG
Yyn4x035pwGwjKGFuQRKYh0AtxwHiWeRIsAJ/B2Z+VGOpcSXH+x/YUfN8Q9FuyGU
zcsVLuGizbooRSMSSoD/y/8veWOnXWbMsh0KKTON/+yTmAcLn2tOzFmsYgHQXatW
0f2XjrdmmWl4VfiekFKFDvGenxum9nEJrzIJOMm6qHnIiyCNA3xbMqmr7oqeIUa+
fQIDAQAB
-----END PUBLIC KEY-----
"""
    let mod = "y_FtQ_cOcx6ZgyaqU54CESfkpttXuNnEZ07nYXXo8ylIiUFpB0r0Fecgv_tIhF1LFCWBHUsqyoSRQz0_iBRnYyIsG-yF_q1K3ll5Q_2GAS9_28jBuJGKDuKIj6dgPlr33si6bjeePTl4ZO6OZFxGYyn4x035pwGwjKGFuQRKYh0AtxwHiWeRIsAJ_B2Z-VGOpcSXH-x_YUfN8Q9FuyGUzcsVLuGizbooRSMSSoD_y_8veWOnXWbMsh0KKTON_-yTmAcLn2tOzFmsYgHQXatW0f2XjrdmmWl4VfiekFKFDvGenxum9nEJrzIJOMm6qHnIiyCNA3xbMqmr7oqeIUa-fQ"
    let exp = "AQAB"
    
    func testGetRSAPublicKeySuccess() {
        do {
            keyConversion = KeyConversion(publicKey: validPublicKey)
            let (modulus, exponent) = try keyConversion.getRSAPublicKey()
            XCTAssertEqual(modulus, mod)
            XCTAssertEqual(exponent, exp)
        } catch {
            XCTFail("Failed to get RSA public key: \(error)")
        }
    }
    
    func testGetRSAPublicKeyFailureForInvliadPublicKey(){
        do{
            let invalidPublicKey = """
-----BEGIN PUBLIC KEY-----
MIIBCgKCAQEArsO4b3i2J/K06jeNbHMmjpso8Szzbk30vEDi7gCQ1YM7DkAWsp8MmWXM4nXBAb/z4Rb94kDqWv5lRn+u8YqsvTYdfmSYAz5UBh5SW4EFYT77F6xAgzxzHOVmYFAfhDYtQVFpi1rRiOIHttlgAcSciydVhp8Pz1ila4CBeLnhR87Blt5f6SZdMRJQvMbRfsNCmC7Q/m6acq5mnEHP3b1/CmIKROYOS1jauCZrgKhzIxYfIwjXNO1WqWo8ieNHXucLPr4TI23rufbwa1Q3JkKLon9t6pScgn3kFrEGbToaP7e6cGMt/V1vjHnui8qbP9fRbkc+5V0hV+KEh2QWU/N3LQIDAQAB
-----END PUBLIC KEY-----
"""
            keyConversion = KeyConversion(publicKey: invalidPublicKey)
            let (modulus, exponent) = try keyConversion.getRSAPublicKey()
        }
        catch{
            XCTAssertEqual(error.localizedDescription, "The operation couldn’t be completed. (VCIClient.InvalidPublicKeyError error 3.)")
        }
    }
}
