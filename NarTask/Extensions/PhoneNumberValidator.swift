//
//  PhoneNumberValidator.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 01.02.24.
//

import Foundation

struct PhoneNumberValidator {
    private let validLength = 11

    func isValidPhoneNumber(_ number: String) -> Bool {
        return hasValidLength(number)
    }

    private func hasValidLength(_ number: String) -> Bool {
        let digitsOnly = number.filter { $0.isNumber }
        return digitsOnly.count == validLength
    }
}
