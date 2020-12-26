//
//  ContentView.swift
//  CryptoCoin
//
//  Created by Prashuk Ajmera on 12/24/20.
//

import SwiftUI
import Combine

struct CoinListView: View {
    
    @ObservedObject private var viewModel = CoinListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.coinViewModels, id: \.self) {coinViewModels in
                Text(coinViewModels.displayText)
            }.onAppear {
                self.viewModel.fetchCoins()
            }.navigationBarTitle("Coins")
        }
    }
}

struct CoinListView_Previews: PreviewProvider {
    static var previews: some View {
        CoinListView()
    }
}
