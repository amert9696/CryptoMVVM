//
//  MarketDataModel.swift
//  investingClone
//
//  Created by Ali Mert Güleç on 17.12.2022.
//

import Foundation

//JSON data:
/*
 
 URL: https://api.coingecko.com/api/v3/global
 
 
 JSON Response:
 {
   "data": {
     "active_cryptocurrencies": 12940,
     "upcoming_icos": 0,
     "ongoing_icos": 49,
     "ended_icos": 3376,
     "markets": 617,
     "total_market_cap": {
       "btc": 50212245.42372533,
       "eth": 710673292.9909362,
       "ltc": 13180972424.94165,
       "bch": 8253665284.97381,
       "bnb": 3535254620.9372706,
       "eos": 951167823208.6261,
       "xrp": 2372612363885.469,
       "xlm": 11257894293287.31,
       "link": 140046850229.56122,
       "dot": 179308245831.89545,
       "yfi": 147880376.83895302,
       "usd": 839285032185.4066,
       "aed": 3082609994713.7764,
       "ars": 145189853109037.34,
       "aud": 1250052109062.7488,
       "bdt": 87833100580926.19,
       "bhd": 315934582520.6484,
       "bmd": 839285032185.4066,
       "brl": 4457781877089.69,
       "cad": 1152883884461.4822,
       "chf": 782157417899.6396,
       "clp": 737739029713456,
       "cny": 5852502386435.293,
       "czk": 19208716531627.35,
       "dkk": 5896984493141.108,
       "eur": 792189391889.3555,
       "gbp": 691110938323.1342,
       "hkd": 6533750047060.162,
       "huf": 321521702979906.8,
       "idr": 13091276493546876,
       "ils": 2907031565980.5884,
       "inr": 69436978138891.02,
       "jpy": 114742853175227.7,
       "krw": 1099428732208907.6,
       "kwd": 257422987216.81107,
       "lkr": 309479125177815.94,
       "mmk": 1768448910467698.5,
       "mxn": 16606932931852.63,
       "myr": 3713416624904.3276,
       "ngn": 374323152906613.44,
       "nok": 8307285212822.769,
       "nzd": 1316732465584.845,
       "php": 46605502033680.695,
       "pkr": 189371660273207.7,
       "pln": 3714565606113.386,
       "rub": 54448612266602.94,
       "sar": 3156062542160.5776,
       "sek": 8738300041101.547,
       "sgd": 1140504430236.7466,
       "thb": 29199787126010.953,
       "try": 15643685500413.414,
       "twd": 25838229000859.863,
       "uah": 30949145007851.363,
       "vef": 84037610272.72487,
       "vnd": 19811323184736510,
       "zar": 14802898148020.387,
       "xdr": 632819235697.7307,
       "xag": 36131699028.05003,
       "xau": 468060869.5994784,
       "bits": 50212245423725.33,
       "sats": 5021224542372533
     },
     "total_volume": {
       "btc": 3255392.727428974,
       "eth": 46074829.95547444,
       "ltc": 854557317.8514388,
       "bch": 535106958.8025463,
       "bnb": 229199911.00758505,
       "eos": 61666726674.10221,
       "xrp": 153822737247.10443,
       "xlm": 729879074302.7605,
       "link": 9079607850.423508,
       "dot": 11625028009.071898,
       "yfi": 9587476.10724291,
       "usd": 54413069301.32619,
       "aed": 199853762236.84073,
       "ars": 9413042334974.203,
       "aud": 81044185744.12773,
       "bdt": 5694452308312.466,
       "bhd": 20482874916.306072,
       "bmd": 54413069301.32619,
       "brl": 289009793939.3407,
       "cad": 74744512645.76662,
       "chf": 50709334913.19263,
       "clp": 47829573280443.664,
       "cny": 379433214852.0088,
       "czk": 1245351917099.4492,
       "dkk": 382317107524.9784,
       "eur": 51359734330.55162,
       "gbp": 44806550742.31544,
       "hkd": 423600303203.8936,
       "huf": 20845102718645.01,
       "idr": 848742093292599.4,
       "ils": 188470548139.00323,
       "inr": 4501783016084.443,
       "jpy": 7439082769530.8,
       "krw": 71278873688214.31,
       "kwd": 16689413376.894846,
       "lkr": 20064350536271.97,
       "mmk": 114653222005603.7,
       "mxn": 1076671402265.3407,
       "myr": 240750625123.71747,
       "ngn": 24268360424779.934,
       "nok": 538583280597.99194,
       "nzd": 85367249687.04865,
       "php": 3021558010367.9834,
       "pkr": 12277465794096.19,
       "pln": 240825116615.5908,
       "rub": 3530047598858.18,
       "sar": 204615885235.95413,
       "sek": 566527112337.6857,
       "sgd": 73941919873.57199,
       "thb": 1893099459112.7334,
       "try": 1014221522628.207,
       "twd": 1675160751510.6238,
       "uah": 2006514959219.4666,
       "vef": 5448380629.141798,
       "vnd": 1284420500857804,
       "zar": 959711053932.8308,
       "xdr": 41027345427.06125,
       "xag": 2342513648.8715897,
       "xau": 30345624.61865654,
       "bits": 3255392727428.974,
       "sats": 325539272742897.44
     },
     "market_cap_percentage": {
       "btc": 38.309785984395766,
       "eth": 16.957314200678876,
       "usdt": 7.870696162517284,
       "usdc": 5.350620144742109,
       "bnb": 4.6232755046918195,
       "busd": 2.1967862295164804,
       "xrp": 2.1223461527225886,
       "doge": 1.265486476989714,
       "ada": 1.1114408733408472,
       "matic": 0.8624571921264791
     },
     "market_cap_change_percentage_24h_usd": -2.5548347994602,
     "updated_at": 1671277275
   }
 }
 
 
 */



struct GlobalData : Codable {
    let data: MarketDataModel?
}


struct MarketDataModel : Codable {
   
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    
    
    enum CodingKeys: String, CodingKey{
        
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap : String {
       
        if let item = totalMarketCap.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        
        return ""
    }
    var volume: String {
        
        if let item = totalVolume.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        
        return ""
    }
    
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: { $0.key == "btc"}){
            return item.value.asPercentString()
        }
        return ""
        
    }
}


