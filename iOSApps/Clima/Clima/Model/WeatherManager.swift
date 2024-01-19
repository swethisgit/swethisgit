//
//  WeatherManager.swift
//  Clima
//
//  Created by Sweda Thiyagarajan on 13/10/2021.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager,  weather: WeatherModel)
    func didFailWithError(_ error: Error)
}

struct WeatherManager {
    var delegate: WeatherManagerDelegate?
    let strURL = "https://api.openweathermap.org/data/2.5/weather?appid=30d3f3b8013e1bfa2a68956678f07410&units=metric"
    
    func fetchWeather(city : String) {
        let urlCall = "\(strURL)&q=\(city)"
        performRequest(urlString: urlCall)
    }
    
    func fetchWeather(withLatitude latitude : CLLocationDegrees, andLongitude longitude: CLLocationDegrees) {
        let degrees = "&lat=\(latitude)&lon=\(longitude)"
        let urlCall = "\(strURL)\(degrees)"
        print(urlCall)
        performRequest(urlString: urlCall)
    }
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let sesion = URLSession(configuration: .default)
            let task = sesion.dataTask(with: url) { data, response, error in
                if error != nil {
                    print (error!)
                    return
                }
                
                if let hasData = data {
                    if let weather = self.parseData(weatherData: hasData) {
                        delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseData(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let donedata = try decoder.decode(WeatherData.self, from: weatherData)
            let weather = WeatherModel.init(conditionId: donedata.weather[0].id, temperature: donedata.main.temp, cityName: donedata.name)
            return weather
        } catch {
            print(error)
            return nil
        }
        
    }
}
