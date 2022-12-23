//
//  DetailViewModell.swift
//  investingClone
//
//  Created by Ali Mert Güleç on 22.12.2022.
//

import Foundation
import Combine

class DetailViewModell : ObservableObject{
    
    @Published var overviewStatistics : [StatisticModel] = []
    @Published var additionalStatistics : [StatisticModel] = []
    @Published var coin : CoinModel
    
    
    private let coinDetailService : CoinDetailDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel){
        self.coin = coin
        self.coinDetailService = CoinDetailDataService(coin: coin)
        self.addSubscribers()
    }
    
    private func addSubscribers(){
        
        coinDetailService.$coinDetails
            .combineLatest($coin)
            .map(mapDataToStatistics)
            .sink{ [weak self] (returnedArray) in
                self?.overviewStatistics = returnedArray.overview
                self?.additionalStatistics = returnedArray.additional
                
            }
            .store(in: &cancellables)
    }
    
    
    private func mapDataToStatistics(coinDetailModel: CoinDetailModel?,coinModel: CoinModel) -> (overview:[StatisticModel], additional:[StatisticModel]){
        
       let overviewArray = createOverviewArray(coinModel: coinModel)
       let addtionalArray = createAdditionalArray(coinDetailModel: coinDetailModel, coinModel: coinModel)
      
        
        return (overviewArray,addtionalArray)
    }
    
   private func createOverviewArray(coinModel : CoinModel) -> [StatisticModel] {
        
      
        let price = coinModel.currentPrice.asCurrencyWith6Decimals()
        let pricePercentChange = coinModel.priceChangePercentage24H
        let priceStat = StatisticModel(tittle: "Current Price", value: price,percentageChange: pricePercentChange)
        
        let marketCap =  "$" + (coinModel.marketCap?.formattedWithAbbreviations() ?? "")
        let marketCapPercentChange = coinModel.marketCapChangePercentage24H
        let marketCapStat = StatisticModel(tittle: "Market Capitalization", value: marketCap,percentageChange: marketCapPercentChange)
        
        let rank = "\(coinModel.rank)"
        let rankStat = StatisticModel(tittle: "Rank", value: rank)
        
        let volume = "$" + (coinModel.totalVolume?.formattedWithAbbreviations() ?? "")
        let volumeStat = StatisticModel(tittle: "Volume", value: volume)
        
        let overviewArray: [StatisticModel] = [
        priceStat,marketCapStat,rankStat,volumeStat
        ]
        return overviewArray
    }
    
   private func createAdditionalArray(coinDetailModel: CoinDetailModel?,coinModel:CoinModel) -> [StatisticModel] {
        
        let high = coinModel.high24H?.asCurrencyWith6Decimals() ?? "n/a"
        let highStat = StatisticModel(tittle: "24h High", value: high)
        
        let low = coinModel.low24H?.asCurrencyWith6Decimals() ?? "n/a"
        let lowStat = StatisticModel(tittle: "24h Low", value: low)
        
        let priceChange = coinModel.priceChange24H?.asCurrencyWith6Decimals() ?? "n/a"
        let pricePercentChange = coinModel.priceChangePercentage24H
        let priceChangeStat = StatisticModel(tittle: "24h Price Change", value: priceChange,percentageChange: pricePercentChange)
        
        let marketCapChange = "$" + (coinModel.marketCapChangePercentage24H?.formattedWithAbbreviations() ?? "")
        let marketCapPercentChange = coinModel.marketCapChangePercentage24H
        let marketCapChangeStat = StatisticModel(tittle: "24h Market Cap Change", value: marketCapChange,percentageChange: marketCapPercentChange)
        
        let blockTime = coinDetailModel?.blockTimeInMinutes ?? 0
        let blockTimeString = blockTime == 0 ? "n/a" : "\(blockTime)"
        let blockStat = StatisticModel(tittle: "Block Time", value: blockTimeString)
        
        let hashing = coinDetailModel?.hashingAlgorithm ?? "n/a"
        let hashingStat = StatisticModel(tittle: "Hashing Algorithm", value: hashing)
        
        let additionalArray: [StatisticModel] = [
        highStat,lowStat,priceChangeStat,marketCapChangeStat,blockStat,hashingStat
        ]
        return additionalArray
    }
}
