//
//  StatisticModel.swift
//  investingClone
//
//  Created by Ali Mert Güleç on 15.12.2022.
//

import Foundation



struct StatisticModel : Identifiable{
    
    let id = UUID().uuidString
    let tittle: String
    let value: String
    let percentageChange: Double?
    

    init(tittle: String, value: String, percentageChange: Double? = nil ) {
        self.tittle = tittle
        self.value = value
        self.percentageChange = percentageChange
    }
}






