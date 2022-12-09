//
//  ContentView.swift
//  investingClone
//
//  Created by Ali Mert Güleç on 29.11.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        ZStack{
            
            Color.theme.background
                .ignoresSafeArea()
            
            VStack(spacing : 40){
                Text("Accent color")
                    .foregroundColor(Color.theme.accent)
                Text("Secondary text color")
                    .foregroundColor(Color.theme.secondaryText)
                Text("REd color ")
                    .foregroundColor(Color.theme.red)
                Text("Green Color ")
                    .foregroundColor(Color.theme.green)
            }
            .font(.headline)
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
