//
//  File.swift
//
//
//  Created by Kiruthika Jeyashankar on 28/08/24.
//

import Foundation
import SwiftCBOR

public class CborLibrayUtils{
    public init() {}
    
    public func decodeAndParseMdoc(base64EncodedString: String) throws -> String{
        guard let decodedBase64Data = Data(base64EncodedURLSafe: base64EncodedString) else {
            print("Invalid base64 URL string provided")
            throw DownloadFailedError.customError(description: "Error while base64 url decoding the credential response")
        }
        
        let inputToCBORDecode = Array(decodedBase64Data)
        
        let decodedCBORData = try! CBOR.decode(inputToCBORDecode)! as CBOR
        var jsonResult = [String: Any]()
       
        let data = parse(cborData: decodedCBORData)
        print("result after decofing \(data)")
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: data, options: [])
            let jsonObject = String(data: jsonData, encoding: .utf8)!
            
            return jsonObject
        } catch {
            print("Error converting to JSON: \(error)")
            throw DownloadFailedError.customError(description: "Error converting to JSON: \(error)")
        }
        
    }
    
    func parse(cborData:CBOR) -> Any {
        if case .tagged(_, let taggedValue) = cborData{
            
            return parse(cborData: taggedValue)
        }
        if case .array(let myCbor) = cborData {

            var cborArray: Array<Any> = Array()
            for cborElement in myCbor {
                let parsed = parse(cborData: cborElement)
                cborArray.append(parsed)
            }
            return cborArray
        }
        if case .map(let myCbor) = cborData {
            
            var cborMap: [String: Any] = [:]
            for (key,value) in myCbor {
                let parsed = parse(cborData: value)
                
                let extractedKey: Any = parse(cborData: key)
                
                cborMap["\(extractedKey)"] = parsed
            }
            return cborMap
        }
        if case .boolean(let myCbor) = cborData {
            return myCbor
        }
        if case .byteString(let myCbor) = cborData {
            do {
                let decodedCBORIn = try CBOR.decode(myCbor)
                
                if(decodedCBORIn==nil){
                    
                    return String(decoding: myCbor, as: UTF8.self)
                }
                return parse(cborData: decodedCBORIn!)
            } catch {
                
                return String(decoding: myCbor, as: UTF8.self)
            }
        }
        if case .date(let myCbor) = cborData {
            
            return myCbor
        }
        if case .double(let myCbor) = cborData {
            
            return myCbor
        }
        if case .float(let myCbor) = cborData {
            
            return myCbor
        }
        if case .simple(let myCbor) = cborData {
            
            return myCbor
        }
        if case .negativeInt(let uInt64) = cborData {
            
            return uInt64
        }
        if case .utf8String(let string) = cborData {
            return string
        }
        if case .unsignedInt(let uInt64) = cborData {
            return uInt64
        }
        
        return "dummy"
    }
    
    /** Parse  the IssuerAuth Block   */
    
    func decodeAndParseIssuerAuth(decodedCBORData: CBOR?) -> [String: Any] {
        let issuerAuth = decodedCBORData?["issuerSigned"]?["issuerAuth"]
        

        
        var validityInfoJson = [String: Any]()
        
        if case .array(let issuerAuthArray)? = issuerAuth {
            for index in issuerAuthArray.indices {
                if index == 2 {
                    if case .tagged(_, let taggedValue) = issuerAuthArray[index] {
                        if case .byteString(let value) = taggedValue {
                            if let issuerAuthElement = try? CBOR.decode(value) {
                                let validityInfo = issuerAuthElement["validityInfo"]
                                if case .tagged(_, let taggedValue) = validityInfo?["signed"] {
                                    if case .utf8String(let actualValue) = taggedValue {
                                        validityInfoJson["signed"] = actualValue
                                    }
                                    
                                }
                                if case .tagged(_, let taggedValue) = validityInfo?["validFrom"] {
                                    if case .utf8String(let actualValue) = taggedValue {
                                        validityInfoJson["validFrom"] = actualValue
                                    }
                                    
                                }
                                if case .tagged(_, let taggedValue) = validityInfo?["validUntil"] {
                                    if case .utf8String(let actualValue) = taggedValue {
                                        validityInfoJson["validUntil"] = actualValue
                                    }
                                    
                                }
                            }
                        }
                        
                    }
                }
            }
        }
        
        return validityInfoJson
    }
    
    
    /** Parse  the Credential Subject Block   */
    
    
    func decodeAndParseCredentialSubject(decodedCBORData: CBOR?) -> [String: Any] {
        var credentialSubjectJson = [String: Any]()
        
        let credentialSubject = decodedCBORData?["issuerSigned"]?["nameSpaces"]?[
            "org.iso.18013.5.1"]
        
        if case .array(let itemArray)? = credentialSubject {
            
            for item in itemArray {
                if case .tagged(_, let cBOR) = item {
                    
                    if case let .byteString(inputByteString) = cBOR {
                        if let nameSpaceElement = try? CBOR.decode(inputByteString) {
                            
                            let elementID = nameSpaceElement["elementIdentifier"]
                            var jsonKey: String?
                            
                            let elementValue = nameSpaceElement["elementValue"]
                            var jsonValue: Any?
                            
                            if case .utf8String(let unwrappedID) = elementID {
                                jsonKey = unwrappedID
                            }
                            
                            if case .utf8String(let unwrappedUTF8String) = elementValue {
                                jsonValue = unwrappedUTF8String
                            }
                            
                            if case .tagged(_, let taggedValue) = elementValue {
                                if case .utf8String(let unwrappedUTF8String) = taggedValue {
                                    jsonValue = unwrappedUTF8String
                                }
                            }
                            if case .array(let drivingPrivilegeArray)? = elementValue {
                                
                                var dpJsonArray = [[String: String]]()
                                
                                for dpItem in drivingPrivilegeArray {
                                    
                                    var dpJson = [String: String]()
                                    
                                    if case .utf8String(let unwrappedUTF8String) = dpItem["vehicle_category_code"] {
                                        dpJson["vehicle_category_code"] = unwrappedUTF8String
                                    }
                                    if case .tagged(_, let taggedValue) = dpItem["expiry_date"] {
                                        if case .utf8String(let unwrappedUTF8String) = taggedValue {
                                            dpJson["expiry_date"] = unwrappedUTF8String
                                        }
                                    }
                                    if case .tagged(_, let taggedItem) = dpItem["issue_date"] {
                                        if case .utf8String(let unwrappedUTF8String) = taggedItem {
                                            dpJson["issue_date"] = unwrappedUTF8String
                                        }
                                    }
                                    dpJsonArray.append(dpJson)
                                    
                                }
                                jsonValue = dpJsonArray
                            }
                            
                            credentialSubjectJson[jsonKey ?? ""] = jsonValue
                            
                        }
                    }
                }
            }
        }
        return credentialSubjectJson
        
    }
    
}
extension Data {
    init?(base64EncodedURLSafe string: String, options: Base64DecodingOptions = []) {
        let string =
        string
            .replacingOccurrences(of: "-", with: "+")
            .replacingOccurrences(of: "_", with: "/")
        
        self.init(base64Encoded: string, options: options)
    }
}
