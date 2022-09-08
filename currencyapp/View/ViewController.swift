//
//  ViewController.swift
//  currencyapp
//
//  Created by Furkan Yiğiter on 24.05.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    private var cryptoListViewModel : CryptoListViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        getData()


    }
    
    func getData(){
        
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
     
        WebService().donwloadCurrencies(url: url) { (cryptolistdata) in
            if let cryptolistdata = cryptolistdata {
                
                self.cryptoListViewModel = CryptoListViewModel(cryptocurrencylist: cryptolistdata)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoTableViewCell

        let cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(index: indexPath.row)

        cell.priceText.text = cryptoViewModel.price
        cell.currencyText.text = cryptoViewModel.name
        
        return cell
    }



}

