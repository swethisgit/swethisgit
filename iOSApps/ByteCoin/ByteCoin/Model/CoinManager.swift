//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "D991BD63-0BDC-4B1C-A33E-4C35A28C2E78"
    var delegate : CoinManagerDelegate?
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(to currency: String) {
        let url = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        sendRequest(url: url)
    }
    
    func sendRequest(url got: String) {
        if let url = URL(string: got) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) -> Void in
                if (error != nil) {
                    self.delegate?.didFailWithError(forName: error!)
                    return
                }
                if let receivedData = data {
                    if let coin = self.parseJSON(received: receivedData){
                        self.delegate?.updateCoinDetails(manage: self, selected: coin)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(received dataAs: Data) -> CoinModel? {
        let decoder = JSONDecoder()
        do {
            let decodedInfo = try decoder.decode(CoinData.self, from: dataAs)
            let coin = CoinModel(rate: decodedInfo.rate, currency: decodedInfo.asset_id_quote )
            return coin
        } catch {
            print(error)
            return nil
        }
    }
}

protocol CoinManagerDelegate {
   func didFailWithError(forName error : Error)
    func updateCoinDetails(manage manager:CoinManager, selected coin : CoinModel)
}
