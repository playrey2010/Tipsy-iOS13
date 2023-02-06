//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var billTextField: UITextField!
    
    var tipsyBrain = TipsyBrain()
    
    var tip = 0.10
    var amountOfSplit = "2"
    
        
    @IBAction func calculatePressed(_ sender: UIButton) {
        let totalBill = Double(billTextField.text!) ?? 0.0
        let amountOfSplit = Double(amountOfSplit) ?? 2.0
        tipsyBrain.calculateTips(totalBill: totalBill, amountOfSplit: amountOfSplit, tipPercentage: tip)
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        switchOffAllButtons()
        sender.isSelected = true
        
        // grab float number from String (removing percentage symbol)
        let tipString = sender.currentTitle!.dropLast()
        tip = Double(tipString)! / 100
        
                
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let stepperString = String(format: "%.0f", sender.value)
        splitNumberLabel.text = stepperString
        amountOfSplit = stepperString
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalValue = tipsyBrain.getAmountPerPerson()
            destinationVC.amountOfPeople = amountOfSplit
            destinationVC.tipPercentage = String(format: "%.0f", tip * 100.0)
        }
    }
    
    func switchOffAllButtons() {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }


}

