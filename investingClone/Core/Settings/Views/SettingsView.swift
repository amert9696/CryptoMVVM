//
//  SettingsView.swift
//  investingClone
//
//  Created by Ali Mert Güleç on 26.12.2022.
//

import SwiftUI


//EVERY DETAIL WILL BE CHANGE --- !!!!!!!

struct SettingsView: View {
    
    let defaultURL = URL(string: "https://www.google.com")!
    let youtubeURL = URL(string: "https://www.youtube.com")!
    let coffeeURL = URL(string: "https://www.buymecoffee.com")!
    let coingeckoURL = URL(string: "https://www.coingecko.com")!
    let personelURL = URL(string: "https://www.github/amert9696.com")!
    
    var body: some View {
        NavigationView{
            
            ZStack{
                //background
                Color.theme.background
                    .ignoresSafeArea()
                
                //content
                List{
                    sections
                        .listRowBackground(Color.theme.background.opacity(0.5))
                    coinGeckoSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                    developerSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                    applicationSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                }
            }
            
            .font(.headline)
            .accentColor(.blue)
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    XMarkButton()
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
 
extension SettingsView {
    
    private var sections: some View {
        Section(header: Text("SWIFTUI")){
            
            VStack(alignment: .leading){
                Image("logo")
                    .resizable()
                    .frame(width: 100,height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This app was made by me. It uses MVVM Architecture,Combine and CoreData!")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }.padding(.vertical)
            Link("Go to youtube",destination: youtubeURL)
            Link("Coffee website ",destination: coffeeURL)
        }
    }
    
    private var coinGeckoSection: some View {
        Section(header: Text("CoinGecko")){
            
            VStack(alignment: .leading){
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("The cryptocurrency data that is used in this app comes from a free API from CoinGecko! Prices may be slightly delayed.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }.padding(.vertical)
            Link("Go to coingecko website",destination: coingeckoURL)
            
        }
    }
    
    private var developerSection: some View {
        Section(header: Text("Developer")){
            
            VStack(alignment: .leading){
                Image("me")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("I am an iOS developer and 3rd year Computer Engineering Student. The project benefits from multi-threading,publishers/subscribers, and data persistance.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }.padding(.vertical)
            Link("Go to my github account",destination: personelURL)
            
        }
    }
    
    private var applicationSection: some View {
        Section(header: Text("Developer")){
            Link("Terms of Service",destination: defaultURL)
            //Link("Privacy Policy",destination: defaultURL)  -> UPDATE THIS LINKS
            //Link("Compony Website",destination: defaultURL)
            //Link("Learn More",destination: defaultURL)
            
        }
    }
}
    
    
    
