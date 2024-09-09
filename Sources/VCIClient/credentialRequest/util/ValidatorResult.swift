//
//  ValidatorResult.swift
//
//
//  Created by Kiruthika Jeyashankar on 08/09/24.
//

import Foundation

public class ValidatorResult {
    var isValidated: Bool = true
    var invalidFields: [String] = []
    
    init(isValidated: Bool = true) {
        self.isValidated = isValidated
    }

    func addInvalidField(_ invalidField: String) {
        self.invalidFields.append(invalidField)
    }

    func setIsInvalid() {
        self.isValidated = false
    }
}
