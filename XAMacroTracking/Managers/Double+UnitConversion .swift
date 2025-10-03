//
//  Double+UnitConversion .swift
//  XAMacroTracking
//
//  Created by Alejandro  Salinas Ramirez on 02/10/25.
//

import Foundation
extension Double {
    var kgToLbs: Double { self * 2.20462 }
    var lbsToKg: Double { self / 2.20462 }
    
    var cmToInches: Double { self * 0.393701 }
    var inchesToCm: Double { self / 0.393701 }
    
    func cmToFeetInches() -> (feet: Int, inches: Int) {
        let totalInches = Int((self * 0.393701).rounded())
        return (totalInches / 12, totalInches % 12)
    }
}
