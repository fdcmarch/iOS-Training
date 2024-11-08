//
//  NetworkManager.swift
//  iOSTraining
//
//  Created by FDC-CrisMarch on 11/8/24.
//

import Foundation
import Alamofire
class NetworkManager {
        static let shared = NetworkManager()
    
    func getAllProducts (completion : () -> Void) {
        let urlString = "https://dummyjson.com/products"
        AF.request(urlString).response { response in
            debugPrint(response)
        }
    }
    
    func getAllProductsNativeWay(completion: @escaping (ProductResponse?) -> Void) {
        let urlString = "https://dummyjson.com/products"
        guard let url = URL(string: urlString) else {
          return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data, error == nil else {
            return
          }
          do {
//            let productList = try JSONSerialization.jsonObject(
//              with: data,
//              options: .fragmentsAllowed
//            ) as? NSDictionary
//            completion(productList)
//            print(productList)
              let decoder = JSONDecoder()
              decoder.keyDecodingStrategy = .convertFromSnakeCase
              let productResponse = try decoder.decode(ProductResponse.self, from: data)
              completion(productResponse)
//              print(productResponse)
          } catch {
            print(error.localizedDescription)
            completion(nil)
          }
        }
        task.resume()
      }
}
