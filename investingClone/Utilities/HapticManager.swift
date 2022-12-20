//
//  HapticManager.swift
//  investingClone
//
//  Created by Ali Mert Güleç on 20.12.2022.
//

import Foundation
import SwiftUI

class HapticManager {
    
    static let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType){
        generator.notificationOccurred(type)
    }
}
