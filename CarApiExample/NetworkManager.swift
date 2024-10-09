//
//  NetworkManager.swift
//  CarApiExample
//
//  Created by Ангел предохранитель on 26.09.2024.
//

import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    let baseUrl: String =  "https://freetestapi.com/api/v1/cars"
    
    private init() {}
    
    func getCars(page: Int, complition: @escaping ([Cars]?, ErrorMassages?) -> Void) {

        guard let url = URL(string: baseUrl) else {
            complition(nil, .invalidUrl)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                complition(nil, .unableToComplate)
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                guard httpResponse.statusCode == 200 else {
                    complition(nil, .invalidResponse)
                   
                    return
                }
                print("Response status code: \(httpResponse.statusCode)")
            } else {
                complition(nil, .invalidResponse)
                return
            }
            
            guard let data = data else {
                complition(nil, .invalidData)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                //print(String(data: data, encoding: .utf8) ?? "No data")
                let cars = try decoder.decode([Cars].self, from: data)
                complition(cars, nil)
            } catch {
                complition(nil, .failidDecode)
            }
        }
        
        task.resume()
    }
}
