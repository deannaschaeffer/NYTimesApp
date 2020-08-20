//
//  NetworkManager.swift
//  dns66_final
//
//  Created by Deanna Schaeffer on 5/7/20.
//  Copyright © 2020 Deanna Schaeffer. All rights reserved.
//

import Foundation
import Alamofire

enum ExampleDataResponse<T: Any> {
    case success(data: T)
    case failure(error: Error)
}

class NetworkManager {
    
    private static let apikey = "uruUVuHPj5GAbQBZKmFHa3qm1PMV3DHJ"
    private static let nyTimesURL = "https://api.nytimes.com/svc/search/v2/articlesearch.json"
    
    static func getArticle(fromHeadline headline: String, _ didGetArticles: @escaping ([Article]) -> Void) {
        
        let parameter: [String: Any] = [
            "q": headline,
            "api-key": apikey
        ]
        
        AF.request(nyTimesURL, method: .get, parameters: parameter).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let decoder = JSONDecoder()

                if let searchData = try? decoder.decode(ArticleSearchResponse.self, from: data) {
                    didGetArticles(searchData.response.docs)
                }

            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func getImage(imageURL: String, completion: @escaping ((UIImage) -> Void)) {
        AF.request(imageURL, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                if let image = UIImage(data: data) {
                    completion(image)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
