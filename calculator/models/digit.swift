//
//  digit.swift
//  calculator
//
//  Created by Dhruv Gohil on 23/10/24.
//

import Foundation

enum Digit : Int, CaseIterable,CustomStringConvertible{
    case zero, one,two, three, four, five, six, seven, eight, nine
    
    var description: String{
        "\(rawValue)"
    }
}

