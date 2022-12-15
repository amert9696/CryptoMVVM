//
//  UIApplication.swift
//  investingClone
//
//  Created by Ali Mert Güleç on 15.12.2022.
//

import Foundation
import SwiftUI


extension UIApplication {
    
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        
    }
}
