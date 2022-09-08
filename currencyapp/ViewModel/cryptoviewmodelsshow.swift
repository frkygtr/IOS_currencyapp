//
//  cryptoviewmodelsshow.swift
//  currencyapp
//
//  Created by Furkan Yiğiter on 24.05.2022.
//

import Foundation

struct CryptoListViewModel{
    
    let cryptocurrencylist : [CryptoCurrencyModel]
    
    func numberOfRowsInSection() -> Int{
        return self.cryptocurrencylist.count
    }
    
    func cryptoAtIndex(index: Int) -> cryptoViewModel{
        
        let crypto = self.cryptocurrencylist[index]
        return cryptoViewModel(cryptoCurrency: crypto)
    }
    
}

struct cryptoViewModel {
    
    let cryptoCurrency : CryptoCurrencyModel
    
    var name : String{
        return self.cryptoCurrency.currency
    }
    
    var price : String{
        return self.cryptoCurrency.price
    }
    
}
