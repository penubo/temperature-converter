//
//  ConvertorModel.swift
//  SimpleConvertor
//
//  Created by Joon on 2018/03/04.
//  Copyright © 2018 penubo. All rights reserved.
//

import Foundation

class ConvertorModel {
    func convert(_ value: Double, from target: String, to result: String) -> Double? {
        let kelvin = Kelvin(with: value, from: target) // convert to kelvin
        let resultValue = kelvin.convert(to: result) // convert to result
        return resultValue ?? nil
    }
}
