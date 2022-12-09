//
//  investingCloneApp.swift
//  investingClone
//
//  Created by Ali Mert Güleç on 29.11.2022.
//

import SwiftUI

@main
struct investingCloneApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeView()
                    .navigationBarHidden(true)
                
            }
        }
    }
}
