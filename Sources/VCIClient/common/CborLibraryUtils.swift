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
        let decodedCBORData: CBOR
        do{
            decodedCBORData = try CBOR.decode(inputToCBORDecode)! as CBOR
        } catch let error {
            print(logTag,"Error while decoding the CBOR data - \(error.localizedDescription)")
            throw DownloadFailedError.customError(description: "Error while decoding the CBOR data \(error.localizedDescription)")
        }
        
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
        switch cborData {
            case .byteString(let myCbor):
                do {
                    let decodedCBORIn = try CBOR.decode(myCbor)
                    
                    if(decodedCBORIn==nil){
                        
                        return String(decoding: myCbor, as: UTF8.self)
                    }
                    return parse(cborData: decodedCBORIn!)
                } catch {
                    return String(decoding: myCbor, as: UTF8.self)
                }
            case .utf8String(let myCbor):
                return myCbor
            case .array(let myCbor):
                var cborArray: Array<Any> = Array()
                for cborElement in myCbor {
                    let parsed = parse(cborData: cborElement)
                    cborArray.append(parsed)
                }
                return cborArray
            case .map(let myCbor):
                var cborMap: [String: Any] = [:]
                for (key,value) in myCbor {
                    let parsed = parse(cborData: value)
                    
                    let extractedKey: Any = parse(cborData: key)
                    
                    cborMap["\(extractedKey)"] = parsed
                }
                return cborMap
            case .unsignedInt(let myCbor), .negativeInt(let myCbor):
                return myCbor
            case .tagged(_, let taggedValue):
                return parse(cborData: taggedValue)
            case .simple(let myCbor):
                return myCbor
            case .boolean(let myCbor):
                return myCbor
            case .half(let myCbor):
                return myCbor
            case .float(let myCbor):
                return myCbor
            case .double(let myCbor):
                return myCbor
            case .date(let myCbor):
                return myCbor
            case .null,.undefined, .break:
                return ""
        }
    }
}
