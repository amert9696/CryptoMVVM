//
//  String.swift
//  investingClone
//
//  Created by Ali Mert Güleç on 26.12.2022.
//

import Foundation

extension String {
    
    
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
    
}
