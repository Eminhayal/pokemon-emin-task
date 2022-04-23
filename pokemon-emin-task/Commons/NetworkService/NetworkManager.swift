//
//  NetworkManager.swift
//  pokemon-emin-task
//
//  Created by Emin Hayal on 21.04.2022.
//

import Foundation

let network = NetworkManager()

final class NetworkManager {
    
    init() { }
    
    func getData<T: Codable>(url: String, completion: @escaping (T?, String?) -> Void) {
        let preparedURL = URL(string: url)
        let task = URLSession.shared.dataTask(with: preparedURL!) { (data, res, error) in
            DispatchQueue.main.async {
                if let data = data {
                    do {
                        let responseObject = try JSONDecoder().decode(T.self, from: data)
                        completion(responseObject, nil)
                    }catch{
                        print("Data Boş", error, error.localizedDescription)
                    }
                }
            }
        }
        task.resume()
    }
    
    func postData<T: Codable, K: Encodable>(url: String, params: K, completion: @escaping (T?) -> Void) {
        
    }
}
