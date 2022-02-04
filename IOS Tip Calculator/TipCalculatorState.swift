//
//  TipCalculatorState.swift
//  IOS Tip Calculator
//
//  Created by Charles Kypros on 2/3/22.
//

import Foundation

public class TipCalculatorState {
    public var tipPercentages = [0.10, 0.18, 0.2, 0.25]
    public static let shared = TipCalculatorState()
}
