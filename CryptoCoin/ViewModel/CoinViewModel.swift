//
//  CoinViewModel.swift
//  CryptoCoin
//
//  Created by Prashuk Ajmera on 12/24/20.
//

import Foundation

struct CoinViewModel: Hashable { // this model is converting Coin model object to objects that we can display
    private let coin: Coin
    
    var name: String {
        coin.name
    }
    
    var formattedPrice: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        guard let price = Double(coin.price), let formattedPrice = numberFormatter.string(from: NSNumber(value: price)) else { return "" }
        return formattedPrice
    }
    
    var displayText: String {
        name + " - " + formattedPrice
    }
    
    init(_ coin: Coin) {
        self.coin = coin
    }
}
