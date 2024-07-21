//
//  Strings.swift
//  DigitalBank
//
//  Created by Rahman Bramantya on 20/07/24.
//

import Foundation

extension String {
    func formattedWithLocalUnits() -> String? {
        guard let number = Double(self) else {
            print("Invalid number")
            return nil
        }

        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        
        
        switch number {
        case 1_000..<1_000_000:
            let formattedNumber = number / 1_000
            return "\(numberFormatter.string(from: NSNumber(value: formattedNumber)) ?? "") RB"
        case 1_000_000..<1_000_000_000:
            let formattedNumber = number / 1_000_000
            return "\(numberFormatter.string(from: NSNumber(value: formattedNumber)) ?? "") JT"
        case 1_000_000_000..<1_000_000_000_000:
            let formattedNumber = number / 1_000_000_000
            return "\(numberFormatter.string(from: NSNumber(value: formattedNumber)) ?? "") M"
        default:
            return numberFormatter.string(from: NSNumber(value: number))
        }
    }
}
