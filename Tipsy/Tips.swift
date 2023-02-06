//
//  Tips.swift
//  Tipsy
//
//  Created by Mercedes Martinez Milantchi on 2/6/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct Tipsy {
    let totalBill: Double
    let amountOfSplit: Double
    let tipPercentage: Double
    var amountPerPerson: Double {
        let billPlusTip = totalBill + (totalBill * tipPercentage)
        return billPlusTip / amountOfSplit
    }
    
    
}
