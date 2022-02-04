//
//  SettingsViewViewController.swift
//  IOS Tip Calculator
//
//  Created by Charles Kypros on 2/3/22.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipPercentage0: UITextField!
    @IBOutlet weak var tipPercentage1: UITextField!
    @IBOutlet weak var tipPercentage2: UITextField!
    @IBOutlet weak var tipPercentage3: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        tipPercentage0.placeholder = String(format: "%.0f", TipCalculatorState.shared.tipPercentages[0] * 100)
        tipPercentage1.placeholder = String(format: "%.0f", TipCalculatorState.shared.tipPercentages[1] * 100)
        tipPercentage2.placeholder = String(format: "%.0f", TipCalculatorState.shared.tipPercentages[2] * 100)
        tipPercentage3.placeholder = String(format: "%.0f", TipCalculatorState.shared.tipPercentages[3] * 100)
    }

    @IBAction func TipPercent1(_ sender: UITextField!) {
        let newValue = Double(sender.text!) ?? 0
        TipCalculatorState.shared.tipPercentages[sender.tag] = newValue * 0.01
    }
    
    
    @IBAction func selectAllText(_ sender: UITextField) {
        sender.becomeFirstResponder()
        sender.selectedTextRange = sender.textRange(from: sender.beginningOfDocument, to: sender.endOfDocument)
    }
}
