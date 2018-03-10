//
//  Kelvin.swift
//  SimpleConvertor
//
//  Created by Joon on 2018/03/09.
//  Copyright © 2018 penubo. All rights reserved.
//

import Foundation

struct Kelvin {
    
    var value: Double?

    func convert(to objectType: String) -> Double? {
        var convertedValue: Double? = nil
        if value != nil {
            switch(objectType) {
            case "Celsius": convertedValue = value! - 273.15
            case "Kelvin": convertedValue = value!
            case "Fahrenheit": convertedValue = value! * 1.8 - 459.67
            default: break
            }
        }
        return convertedValue?.roundValue()
    }
    
    static func isValid(_ value: Double, _ scale: String) -> Bool {
        switch(scale) {
        case "Celsius":
            return value > -273.15
        case "Kelvin": return value > 0
        case "Fahrenheit": return value > -459.67
        default: return false
        }
    }
    
    init(with value: Double, from scale: String) {
        // TODO: check precondition for each value
        if !Kelvin.isValid(value, scale) {
            self.value = nil
            print("unValid Value")
            return
        }
        var convertedValue: Double = 0
        switch(scale){
        case "Celsius": convertedValue = value + 273.15
        case "Kelvin": convertedValue = value
        case "Fahrenheit": convertedValue = (value + 459.67) * 5/9
        default: break
        }
        self.value = convertedValue
    }
}

extension Double {
    
    mutating func roundValue() -> Double{
        return Darwin.round(self * 1000) / 1000
    }
}
