import Foundation
import SwiftCBOR

public class CborLibrayUtils{
    public init() {}
    
    public func decodeAndParseMdoc(base64EncodedString: String) throws -> [String:Any]{
        let logTag = Util.getLogTag(className: String(describing: type(of: self)))
        guard let decodedBase64Data = Data(base64EncodedURLSafe: base64EncodedString) else {
            print(logTag,"Invalid base64 URL string provided")
            throw DownloadFailedError.customError(description: "Error while base64 url decoding the credential response")
        }
        
        let inputToCBORDecode = Array(decodedBase64Data)
        let decodedCBORData = try! CBOR.decode(inputToCBORDecode)! as CBOR
        var jsonResult = [String: Any]()
        
        if case .map(let myCbor) = decodedCBORData {
            for (key,value) in myCbor {
                let parsed = parse(cborData: value)
                let extractedKey: Any = parse(cborData: key)
                jsonResult["\(extractedKey)"] = parsed
            }
        }
       
        return jsonResult
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
        
        return ""
    }
}
