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
    
    @StateObject private var vm: DetailViewModell
    private let colums: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    private let spacing : CGFloat = 30
    
    init(coin: CoinModel){
        _vm = StateObject(wrappedValue: DetailViewModell(coin: coin))
     
        
    }
    
    var body: some View {
        ScrollView{
            VStack(spacing: 20){
                Text("")
                    .frame(height: 150)
                overviewTittle
                Divider()
                overviewGrid
                additionalTittle
                Divider()
                additionalGrid
          
            }.padding()
        }
        .navigationTitle(vm.coin.name)
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
}
