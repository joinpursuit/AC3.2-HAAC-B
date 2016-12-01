//
//  APIRequestManager.swift
//  HAAC-B
//
//  Created by Ana Ma on 12/1/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIRequestManager {
    //MARK: - Properties
    static let shared = APIRequestManager()
    
    var source: String = "business-insider"
    
    //MARK: - Initializer
    private init() {}
    
    //MARK: - Methods
    func getData(complete: @escaping ([Article]?) -> Void ){
        Alamofire.request("https://newsapi.org/v1/articles?apiKey=9c15262616974a2895a119a6626dbd2a&source=\(APIRequestManager.shared.source)").validate().responseJSON { (response) in
            if let rawJSON = response.result.value {
                let json = JSON(rawJSON)
                guard let articlesArray = json["articles"].array else { return }
                
                var allArticles: [Article] = []
                for article in articlesArray {
                    if let title = article["title"].string,
                        let description = article["description"].string,
                        let url = article["url"].string,
                        let urlToImage = article["urlToImage"].string {
                        
                        let author = article["author"].string
                        let publishedAt = article["publishedAt"].string
                        
                        let myArticle = Article(author: author ?? "", title: title, description: description, url: url, urlToImage: urlToImage, publishedAt: publishedAt ?? "")
                        allArticles.append(myArticle)
                    }
                }
                complete(allArticles)
            }
        }.resume()
    }
    
    func getImage(imageString: String, complete: @escaping (Data?) -> Void ) {
            guard let url = URL(string: imageString) else { return }
            let session = URLSession(configuration: .default)
            session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
                if error != nil {
                    print(error)
                }
                
                if data != nil {
                    complete(data)
                }
                }.resume()
    }
    
    func getImage2(imageString: String, complete: @escaping (Data?) -> Void ) {
        Alamofire.request("https://httpbin.org/get").responseData { response in
            debugPrint("All Response Info: \(response)")
            
            if let data = response.result.value, let utf8Text = String(data: data, encoding: .utf8) {
                
                print("Data: \(utf8Text)")
                complete(data)
            }
        }.resume()
    }
    
    
}
