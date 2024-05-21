import Foundation

class Util {
    private static var traceabilityId: String?
    
    static func getLogTag(className: String, traceabilityId: String? = nil) -> String {
        if let traceId = traceabilityId {
            self.traceabilityId = traceId
        }
        return "INJI-VCI-Client : \(className) | traceID \(self.traceabilityId ?? "")"
    }
}
