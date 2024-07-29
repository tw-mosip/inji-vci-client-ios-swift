////
////  File.swift
////  
////
////  Created by Pooja Babusing on 16/07/24.
////
//import Foundation
//
//struct AnyCodable: Codable {
//    var value: Any
//
//    init(_ value: Any) {
//        self.value = value
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        
//        if let int = try? container.decode(Int.self) {
//            value = int
//        } else if let double = try? container.decode(Double.self) {
//            value = double
//        } else if let string = try? container.decode(String.self) {
//            value = string
//        } else if let bool = try? container.decode(Bool.self) {
//            value = bool
//        } else if let nestedDict = try? container.decode([String: AnyCodable].self) {
//            value = nestedDict.mapValues { $0.value }
//        } else if let nestedArray = try? container.decode([AnyCodable].self) {
//            value = nestedArray.map { $0.value }
//        } else if let data = try? container.decode(Data.self) {
//            value = data
//        } else if container.decodeNil() {
//            value = Optional<Any>.none as Any
//        } else {
//            throw DecodingError.typeMismatch(
//                AnyCodable.self,
//                DecodingError.Context(
//                    codingPath: container.codingPath,
//                    debugDescription: "Cannot decode AnyCodable"
//                )
//            )
//        }
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        
//        if let int = value as? Int {
//            try container.encode(int)
//        } else if let double = value as? Double {
//            try container.encode(double)
//        } else if let string = value as? String {
//            try container.encode(string)
//        } else if let bool = value as? Bool {
//            try container.encode(bool)
//        } else if let nestedDict = value as? [String: Any] {
//            try container.encode(nestedDict.mapValues { AnyCodable($0) })
//        } else if let nestedArray = value as? [Any] {
//            try container.encode(nestedArray.map { AnyCodable($0) })
//        } else if let data = value as? Data {
//            try container.encode(data)
//        } else if value is Optional<Any> {
//            try container.encodeNil()
//        } else {
//            throw EncodingError.invalidValue(
//                value,
//                EncodingError.Context(
//                    codingPath: container.codingPath,
//                    debugDescription: "Cannot encode AnyCodable"
//                )
//            )
//        }
//    }
//}
//
//do {
//    let jsonData = """
//{
//    "docType": {
//        "value": "org.iso.18013.5.1.mDL",
//        "attribute": {
//            "type": "textString"
//        },
//        "type": "textString"
//    },
//    "issuerSigned": {
//        "nameSpaces": {
//            "org.iso.18013.5.1": [
//                {
//                    "value": "a4686469676573744944006672616e646f6d506eebcb23132a7916bef3bfe40e1052c471656c656d656e744964656e7469666965726b66616d696c795f6e616d656c656d656e7456616c756563446f65",
//                    "attribute": {
//                        "type": "encodedCbor"
//                    },
//                    "type": "encodedCbor"
//                },
//                {
//                    "value": "a4686469676573744944016672616e646f6d50e000e4a0555484ca97ffe67b75c4e12a71656c656d656e744964656e7469666965726a676976656e5f6e616d656c656d656e7456616c7565644a6f686e",
//                    "attribute": {
//                        "type": "encodedCbor"
//                    },
//                    "type": "encodedCbor"
//                },
//                {
//                    "value": "a4686469676573744944026672616e646f6d504a3c4d58b32fcd853a61dec58501d3ea71656c656d656e744964656e7469666965726f69737375696e675f636f756e7472796c656c656d656e7456616c7565625553",
//                    "attribute": {
//                        "type": "encodedCbor"
//                    },
//                    "type": "encodedCbor"
//                },
//                {
//                    "value": "a4686469676573744944036672616e646f6d5011226afca4d519f59257cabc6bfe7ee871656c656d656e744964656e7469666965726f646f63756d656e745f6e756d6265726c656c656d656e7456616c756569313233343536373839",
//                    "attribute": {
//                        "type": "encodedCbor"
//                    },
//                    "type": "encodedCbor"
//                },
//                {
//                    "value": "a4686469676573744944046672616e646f6d5092e8631b753ea45e68dd11e0e8fff48b71656c656d656e744964656e7469666965727169737375696e675f617574686f726974796c656c656d656e7456616c756563585858",
//                    "attribute": {
//                        "type": "encodedCbor"
//                    },
//                    "type": "encodedCbor"
//                },
//                {
//                    "value": "a4686469676573744944056672616e646f6d50a4ac6eaa9da7e0f3a06c106654a4388471656c656d656e744964656e7469666965726a69737375655f646174656c656d656e7456616c75656a323032332d30312d3031",
//                    "attribute": {
//                        "type": "encodedCbor"
//                    },
//                    "type": "encodedCbor"
//                },
//                {
//                    "value": "a4686469676573744944066672616e646f6d50ff6c80d17369346024f09a98e0c057e671656c656d656e744964656e7469666965726b6578706972795f646174656c656d656e7456616c75656a323034332d30312d3031",
//                    "attribute": {
//                        "type": "encodedCbor"
//                    },
//                    "type": "encodedCbor"
//                },
//                {
//                    "value": "a4686469676573744944076672616e646f6d5063cb01bd9381bbbfd724e2bf05fa1ba471656c656d656e744964656e7469666965726a62697274685f646174656c656d656e7456616c75656a323030332d30312d3031",
//                    "attribute": {
//                        "type": "encodedCbor"
//                    },
//                    "type": "encodedCbor"
//                },
//                {
//                    "value": "a4686469676573744944086672616e646f6d503a9d3f1c103542db9ee3c8d07d481b9871656c656d656e744964656e7469666965727264726976696e675f70726976696c656765736c656c656d656e7456616c756581a37576656869636c655f63617465676f72795f636f646561416a69737375655f646174656a323032332d30312d30316b6578706972795f646174656a323034332d30312d3031",
//                    "attribute": {
//                        "type": "encodedCbor"
//                    },
//                    "type": "encodedCbor"
//                },
//                {
//                    "value": "a463d",
//                    "attribute": {
//                        "type": "encodedCbor"
//                    },
//                    "type": "encodedCbor"
//                }
//            ]
//        },
//        "issuerAuth": {
//            "data": [
//                {
//                    "value": "a10126",
//                    "attribute": {
//                        "type": "byteString"
//                    },
//                    "type": "byteString"
//                },
//                {
//                    "value": {
//                        "33": {
//                            "value": "3082c",
//                            "attribute": {
//                                "type": "byteString"
//                            },
//                            "type": "byteString"
//                        }
//                    },
//                    "attribute": {
//                        "type": "map"
//                    },
//                    "type": "map"
//                },
//                {
//                    "value": "d305a",
//                    "attribute": {
//                        "type": "byteString"
//                    },
//                    "type": "byteString"
//                },
//                {
//                    "value": "69f3c3c8fa37d4cd95bfe08684a703690676798470ba5bc32e51faeaac734afd14d9f4d9722eda7f1b8447fd2eb83c48fb96d5c255b737650aeabcad5a2c",
//                    "attribute": {
//                        "type": "byteString"
//                    },
//                    "type": "byteString"
//                }
//            ]
//        }
//    }
//}
//""".data(using: .utf8)!
//
//    let decoder = JSONDecoder()
//    let anyCodable = try decoder.decode(AnyCodable.self, from: jsonData)
//    print(anyCodable.value)
//} catch {
//    print("Decoding failed: \(error)")
//}
