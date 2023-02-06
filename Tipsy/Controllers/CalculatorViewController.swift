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
    
    var tip = 0.10
    var amountOfSplit = "2"
    
    
    var amountPerPersonString: String?
    
    @IBAction func calculatePressed(_ sender: UIButton) {
//        print(tip)
//        print(amountOfSplit)
//        print(billTextField.text!)
        
        let totalBill = Double(billTextField.text!) ?? 0.0
        
        let billPlusTip = totalBill + (totalBill * tip)
        let amountOfSplit = Double(amountOfSplit) ?? 2.0
        let amountPerPerson = billPlusTip / amountOfSplit
        amountPerPersonString = String(format: "%.2f", amountPerPerson)
        self.performSegue(withIdentifier: "goToResults", sender: self)
        
        
        
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
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
            destinationVC.totalValue = amountPerPersonString!
            destinationVC.amountOfPeople = amountOfSplit
            destinationVC.tipPercentage = String(format: "%.0f", tip * 100.0)
        }
    }


}

