//
//  ViewController.swift
//  IOS Tip Calculator
//
//  Created by Charles Kypros on 1/14/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var partyAmountLabel: UILabel!
    @IBOutlet weak var PartyAmountControl: UIStepper!
    @IBOutlet weak var totalPerPersonLabel: UILabel!
    @IBOutlet weak var totalPerPersonStack: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tip Calculator"
        // Do any additional setup after loading the view.
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        TipCalculatorState.shared.tipPercentages.sort()
        for (index, percent) in TipCalculatorState.shared.tipPercentages.enumerated() {
            tipControl.setTitle(String(format: "%.0f%%", percent * 100), forSegmentAt: index)
        }
    }
    
    
    @IBAction func updatePartySize(_ sender: Any) {
        // Update the party size, then update the calculation accordingly
        partyAmountLabel.text = String(format: "%.0f", PartyAmountControl.value)
        calculateTip(PartyAmountControl!)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Get total tip by multiplying tip * tipPercentage
        
        let tip = bill * TipCalculatorState.shared.tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
        // Update Total Amount
        totalLabel.text = String(format: "$%.2f", total)
        
        // Update the total per person
        if PartyAmountControl.value == 1 {
            totalPerPersonStack.isHidden = true
        } else {
            let totalPerPerson = total / PartyAmountControl.value
            totalPerPersonStack.isHidden = false
            totalPerPersonLabel.text = String(format: "$%.2f", totalPerPerson)
        }
        
    }
    
}

