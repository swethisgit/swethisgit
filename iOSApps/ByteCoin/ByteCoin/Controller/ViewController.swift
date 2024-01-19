//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currencyPicker: UIPickerView!
    @IBOutlet weak var currency: UILabel!
    @IBOutlet weak var bitCoin: UILabel!
    
    var coinManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Picker data source, delegate
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        
        // Coin manager delegates
        coinManager.delegate = self
        
        currency.text = coinManager.currencyArray[currencyPicker.selectedRow(inComponent: 0)]
    }
}

//MARK: - Pickerview data source methods

extension ViewController:UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        coinManager.currencyArray.count
    }
}

//MARK: - Pickerview delegate methods

extension ViewController:UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView,
                 titleForRow row: Int,
                    forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView,
                didSelectRow row: Int,
                    inComponent component: Int) {
        print(coinManager.currencyArray[row])
        coinManager.getCoinPrice(to: coinManager.currencyArray[row])
    }
}

//MARK: - Coin manager delegate
extension ViewController: CoinManagerDelegate {
    func didFailWithError(forName error: Error) {
        print(error)
    }
    
    func updateCoinDetails(manage manager: CoinManager, selected coin: CoinModel) {
        print("rate: \(coin.displayRate)")
        DispatchQueue.main.async {
            self.bitCoin.text = String(coin.displayRate)
            self.currency.text = coin.currency
        }
    }
}
