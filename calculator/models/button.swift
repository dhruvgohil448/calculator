//
//  button.swift
//  calculator
//
//  Created by Dhruv Gohil on 23/10/24.
//

import Foundation
import SwiftUI

enum buttontype: Hashable,CustomStringConvertible{
    case digit(_digit: Digit)
    case operation(_operator: arithmeticoperation)
    case negative
    case percent
    case decimal
    case equals
    case allclear
    case clear
    
    var description: String{
        switch self{
        case .digit( let digit):
            return digit.description
        case .operation( let operation):
            return operation.description
        case .negative:
            return "+-"
        case .percent:
            return "%"
        case .decimal:
            return "."
        case .equals:
            return "="
        case .allclear:
            return "AC"
        case .clear:
            return "C"
        }
    }
    var backgroundColor: Color{
        switch self{
        case .allclear, .clear, .negative, .percent:
            return Color(.lightGray)
        case .operation, .equals:
            return .orange
        case .digit, .decimal:
            return .secondary
            
        }
    }
    var foregroundColor: Color{
        switch self{
        case .allclear, .clear, .negative, .percent:
            return .black
        default:
            return .white
        }
    }
}
