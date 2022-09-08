//
//  crytoservice.swift
//  currencyapp
//
//  Created by Furkan Yiğiter on 24.05.2022.
//

import Foundation

class WebService {
    
    func donwloadCurrencies(url: URL, completion: @escaping ([CryptoCurrencyModel]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error{
            
                print(error.localizedDescription)
                completion(nil)
            
            } else if let data = data{
                
                let cryptolist = try? JSONDecoder().decode([CryptoCurrencyModel].self, from: data)
                
                print(cryptolist)
                
                completion(cryptolist)
                
            }

        }.resume()
        
    }
    
}
