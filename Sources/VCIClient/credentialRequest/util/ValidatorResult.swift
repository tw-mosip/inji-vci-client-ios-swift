//
//  ValidatorResult.swift
//
//
//  Created by Kiruthika Jeyashankar on 08/09/24.
//

import Foundation

public class ValidatorResult {
    var isValid: Bool = true
    var invalidFields: [String] = []
    
    init(isValid: Bool = true) {
        self.isValid = isValid
    }

    func addInvalidField(_ invalidField: String) {
        self.isValid = false
        self.invalidFields.append(invalidField)
    }
}
