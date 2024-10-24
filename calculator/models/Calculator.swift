//
//  Calculator.swift
//  calculator
//
//  Created by Dhruv Gohil on 23/10/24.
//

import Foundation

struct Calculator {
    
private struct ArithmeticExpression: Equatable {
        var number: Decimal
        var operation: ArithmeticOperation
        
        func evaluate(with secondNumber: Decimal) -> Decimal {
            switch operation {
            case .addition:
                return number + secondNumber
            case .subtraction:
                return number - secondNumber
            case .multiplication:
                return number * secondNumber
            case .division:
                return number / secondNumber
            }
        }
    }
    
    private enum ArithmeticOperation {
        case addition, subtraction, multiplication, division
    }
    
    private var newNumber: Decimal? {
        didSet {
            guard newNumber != nil else { return }
            carryingNegative = false
            carryingDecimal = false
            carryingZeroCount = 0
            pressedClear = false
        }
    }
    
    private var expression: ArithmeticExpression?
    private var result: Decimal?
    
    private var carryingNegative: Bool = false
    private var carryingDecimal: Bool = false
    private var carryingZeroCount: Int = 0
    private var pressedClear: Bool = false
    
    var displayValue: String {
        return getNumberString(forNumber: number, withCommas: true)
    }
    
    var showAllClear: Bool {
        return (newNumber == nil && expression == nil && result == nil) || pressedClear
    }
    
    var number: Decimal? {
        if pressedClear || carryingDecimal {
            return newNumber
        }
        return newNumber ?? expression?.number ?? result
    }
    
    private var containsDecimal: Bool {
        return getNumberString(forNumber: number).contains(".")
    }
    
    mutating func setDigit(_ digit: Int) {
        if containsDecimal && digit == 0 {
            carryingZeroCount += 1
        } else if canAddDigit(digit) {
            let numberString = getNumberString(forNumber: newNumber)
            newNumber = Decimal(string: numberString.appending("\(digit)"))
        }
    }
    
         mutating  private func SetOperator(_ operator: ArithmeticOperation) {
    
    }
    
    private func getNumberString(forNumber number: Decimal?, withCommas: Bool = false) -> String {
        var numberString = (withCommas ? number?.formatted(.number) : number.map(String.init)) ?? "0"
        
        if carryingNegative {
            numberString.insert("-", at: numberString.startIndex)
        }
        if carryingDecimal {
            numberString.append(".")
        }
        if carryingZeroCount > 0 {
            numberString.append(String(repeating: "0", count: carryingZeroCount))
        }
        return numberString
    }
    
    private func canAddDigit(_ digit: Int) -> Bool {
        return number != nil || digit != 0
    }
}


