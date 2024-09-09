//
//  File.swift
//  
//
//  Created by Kiruthika Jeyashankar on 09/09/24.
//

import Foundation

extension String? {
    func isBlank() -> Bool {
        return self == nil || self!.replacingOccurrences(of: " ", with: "").count == 0
    }
}
