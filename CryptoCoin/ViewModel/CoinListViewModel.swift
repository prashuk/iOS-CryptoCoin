//
//  CoinListViewModel.swift
//  CryptoCoin
//
//  Created by Prashuk Ajmera on 12/24/20.
//

import SwiftUI
import Combine

class CoinListViewModel: ObservableObject {
    private let cryptoService = CryptoService() // inject service
    
    @Published var coinViewModels = [CoinViewModel]() // whenever this array changes the swiftui knows it with published var and update ui
    
    var cancellable: AnyCancellable?
    
    func fetchCoins() {
        cancellable = cryptoService.fetchCoins().sink(receiveCompletion: { (_) in
            
        }, receiveValue: { (cryptoContainer) in
            self.coinViewModels = cryptoContainer.data.coins.map { CoinViewModel($0) }
        })
    }
}
