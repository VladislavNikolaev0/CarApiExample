//
//  NetworkManager.swift
//  CarApiExample
//
//  Created by Ангел предохранитель on 26.09.2024.
//

import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    let baseUrl: String =  "https://api.api-ninjas.com/v1/carmakes" //"https://api.api-ninjas.com/v1/cars"
    
    private init() {}
    
    func getCars(page: Int, complition: @escaping ([Cars]?, String?) -> Void) {
        let endpoint = baseUrl //+ "?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            complition(nil, "Eror in url")
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue(Keys.myApiKey, forHTTPHeaderField: "X-Api-Key")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let _ = error {
                complition(nil, "Error in start url session")
                return
            }
            
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//                complition(nil, "Error in try cast response or response status")
//                print("Response status code: \(response.statusCode)")
//                return
//            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print("Response status code: \(httpResponse.statusCode)")
                guard httpResponse.statusCode == 200 else {
                    complition(nil, "Error: Status code is not 200")
                    return
                }
            } else {
                complition(nil, "Error in casting response to HTTPURLResponse")
                return
            }
            
            guard let data = data else {
                complition(nil, "Error in data")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                //decoder.keyDecodingStrategy = .convertFromSnakeCase
                print(String(data: data, encoding: .utf8) ?? "No data")
                let cars = try decoder.decode([Cars].self, from: data)
                complition(cars, nil)
            } catch {
                complition(nil, "Failed to decode JSON: \(error.localizedDescription)")
            }
        }
        
        task.resume()
    }
}
