//
//  TipsyBrain.swift
//  Tipsy
//
//  Created by Mercedes Martinez Milantchi on 2/6/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct TipsyBrain {
    var tipsy: Tipsy?
    
    func getAmountPerPerson() -> String {
        let amountDouble = tipsy?.amountPerPerson
        return String(format: "%.2f", amountDouble ?? 0.00)
    }
    
    mutating func calculateTips(totalBill: Double, amountOfSplit: Double, tipPercentage: Double) {
        let calculateTipsy = Tipsy(totalBill: totalBill, amountOfSplit: amountOfSplit, tipPercentage: tipPercentage)
        tipsy = calculateTipsy
    }
    
    func getAmountOfSplit() -> String {
        let splitString = String(format: "%.0f", tipsy?.amountOfSplit ?? 2.00)
        return splitString
    }


    
    
}
