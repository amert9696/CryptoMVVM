//
//  SettingsView.swift
//  investingClone
//
//  Created by Ali Mert Güleç on 26.12.2022.
//

import SwiftUI
import SafariServices

//EVERY DETAIL WILL BE CHANGE --- !!!!!!!

struct SettingsView: View {
    
    let defaultURL = URL(string: "https://www.google.com")!
    let coingeckoURL = URL(string: "https://www.coingecko.com")!
    
  
    
    
    var body: some View {
        NavigationView{
            
            ZStack{
                //background
                Color.theme.background
                    .ignoresSafeArea()
                
                //content
                List{
//                    generalAppInfoPart
//                        .listRowBackground(Color.theme.background.opacity(0.5))
                    developerSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                    coinGeckoSection
//                        .listRowBackground(Color.theme.background.opacity(0.5))
//                    applicationSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                }
            }
            
            .font(.headline)
            .accentColor(.blue)
            .listStyle(GroupedListStyle())
            .navigationTitle("About me and app")
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

//    private var generalAppInfoPart: some View { // will be update
//        Section(header: Text("SWIFTUI")){
//
//            VStack(alignment: .leading){
//                Image("logo")
//                    .resizable()
//                    .frame(width: 100,height: 100)
//                    .clipShape(RoundedRectangle(cornerRadius: 20))
//                Text("This app was made by me. It uses MVVM Architecture,Combine and CoreData!")
//                    .font(.callout)
//                    .fontWeight(.medium)
//                    .foregroundColor(Color.theme.accent)
//            }.padding(.vertical)
//            Link("You can go to my github ",destination: githubURL)
//            Link("Follow me on twitter ",destination: twitterURL)
//            Link("My linkedIn account ",destination: linkedInURL)
//
//        }
//    }
    
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
        Section(header: Text("Developer Information")){
            
            VStack(alignment:.leading){
                VStack(alignment: .leading){
                    Image("me")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    Text("I am an iOS developer and 3rd year Computer Engineering Student. The project benefits from multi-threading,publishers/subscribers, and data persistance.If you want to contact me, you can reach the following accounts.")
                        .font(.callout)
                        .fontWeight(.medium)
                        .foregroundColor(Color.theme.accent)
                }.padding(.vertical)
                 
                    }
            githubAccountButton
            twitterAccountButton
            mediumButton
            linkedInButton
              
                        }
                    }
        }
//    private var applicationSection: some View {
//        Section(header: Text("Developer")){
//            Link("Terms of Service",destination: defaultURL)
//            //Link("Privacy Policy",destination: defaultURL)  -> UPDATE THIS LINKS
//            //Link("Compony Website",destination: defaultURL)
//            //Link("Learn More",destination: defaultURL)
//
//        }
//    } }

private var githubAccountButton: some View{
    Button(action: {
                    guard let url = URL(string:"https://github.com/amert9696") else { return }
                    UIApplication.shared.open(url)
                }) {
                    HStack{
                        Text("Go to my GitHub account")
                        Image("github-mark")
                                            .resizable()
                                            .frame(width: 30,height: 30)
                                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                }
    
}
private var twitterAccountButton: some View {
    
    Button(action: {
        guard let url = URL(string: "https://twitter.com/alimertgulec") else { return }
        UIApplication.shared.open(url)
    }) {
        HStack{
            Text("Go to my Twitter account")
            Image("twitter")
                                .resizable()
                                .frame(width: 30,height: 30)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
            
        }
    }
}

private var linkedInButton : some View {
    
    Button(action: {
        guard let url = URL(string: "https://www.linkedin.com/in/ali-mert-g%C3%BCle%C3%A7-600908196") else { return }
        UIApplication.shared.open(url)
    }) {
        HStack{
            Text("Go to my LinkedIn account")
            Image("linked-in")
                                .resizable()
                                .frame(width: 30,height: 30)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
            
        }
    }
}
private var mediumButton: some View {
    Button(action: {
        guard let url = URL(string: "https://medium.com/@amert96") else { return }
        UIApplication.shared.open(url)
    }) {
        HStack{
            Text("Go to my medium account")
            Image("medium")
                .resizable()
                .frame(width: 30,height: 30)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
        }
    }
    
}

