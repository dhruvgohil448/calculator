//
//  arithematicoperation.swift
//  calculator
//
//  Created by Dhruv Gohil on 23/10/24.
//

import Foundation

enum arithmeticoperation : CaseIterable, CustomStringConvertible{
    case addition, subtraction, multiplication, division
    
    var description: String{
        switch self{
        case .addition :
            return "+"
        case .subtraction :
            return "-"
        case .multiplication :
            return "*"
        case .division :
            return "/"
        }
    }
}
