//
//  DetailView.swift
//  investingClone
//
//  Created by Ali Mert Güleç on 21.12.2022.
//

import SwiftUI

struct DetailLoadingView : View {
    
    @Binding var coin : CoinModel?
    
    var body: some View {
        ZStack {
            if let coin = coin {
                DetailView(coin: coin)
            }
        }
    }
}

struct DetailView: View {
    
    @StateObject private var vm: DetailViewModel
    @State private var showFullDescription : Bool = false
    
    private let colums: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    private let spacing : CGFloat = 30
    
    init(coin: CoinModel){
        _vm = StateObject(wrappedValue: DetailViewModel(coin: coin))

    }
    
    var body: some View {
        ScrollView{
            VStack{
                ChartView(coin: vm.coin)
                    .padding(.vertical)
                VStack(spacing: 20){
                    overviewTittle
                    Divider()
                    descriptionSection
                    overviewGrid
                    additionalTittle
                    Divider()
                    additionalGrid
                    websiteSection
                
                }.padding()
            }
        }
        .background(
            Color.theme.background
                .ignoresSafeArea()
        )
        .navigationTitle(vm.coin.name)
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
               navigationBarTrailingItems
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            DetailView(coin: dev.coin)
        }
    }
}
extension DetailView {
    
    private var navigationBarTrailingItems: some View {
        
        HStack {
            Text(vm.coin.symbol.uppercased())
                .font(.headline)
            .foregroundColor(Color.theme.secondaryText)
            CoinImageView(coin: vm.coin)
                .frame(width: 25,height: 25)
        }
    }
    
    private var overviewTittle : some View {
        Text("Overview")
            .font(.title)
            .bold()
            .foregroundColor(Color.theme.accent)
            .frame(maxWidth: .infinity,alignment: .leading)
    }
    
    private var additionalTittle: some View {
        Text("Additional Details")
            .font(.title)
            .bold()
            .foregroundColor(Color.theme.accent)
            .frame(maxWidth: .infinity,alignment: .leading)
        
    }
    
    private var descriptionSection: some View{
        ZStack{
            if let coinDescription = vm.coinDescription,
               !coinDescription.isEmpty{
                VStack(alignment:.leading){
                    Text(coinDescription)
                        .lineLimit(showFullDescription ? nil : 3)
                        .font(.callout)
                        .foregroundColor(Color.theme.secondaryText)
                    
                    Button(action: {
                        withAnimation(.easeInOut){
                            showFullDescription.toggle()
                        }
                        
                    },label: {
                        Text(showFullDescription ? "Less" : "Read More")
                            .font(.caption)
                            .fontWeight(.bold)
                            
                    })
                    .accentColor(.blue)
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                
            }
        }
    }
    
    private var overviewGrid: some View {
        LazyVGrid(columns: colums,
                  alignment: .leading,
                  spacing: spacing ,
                  pinnedViews: [],
                  content: {
            
            ForEach(vm.overviewStatistics) { stat in
                
                StatisticView(stat: stat)
                
            }
        })
    }
    
    
    private var additionalGrid: some View{
        
        LazyVGrid(columns: colums,
                  alignment: .leading,
                  spacing: spacing ,
                  pinnedViews: [],
                  content: {
            
            ForEach(vm.additionalStatistics) { stat in
                
                StatisticView(stat: stat)
                
            }
        } )
        
    }
    private var websiteSection: some View{
        VStack(alignment: .leading,spacing: 10){
            if let websiteString = vm.websiteURL,
               let url = URL(string: websiteString){
                Link("Website", destination: url)
            }
            if let redditString = vm.redditURL,
               let url = URL(string: redditString){
                Link("Reddit", destination: url)
            }
            
        }
        .accentColor(.blue)
        .frame(maxWidth: .infinity,alignment: .leading)
        .font(.headline)
    }
}
