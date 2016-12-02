//
//  Article.swift
//  Pods
//
//  Created by Ana Ma on 12/1/16.
//
//

import Foundation
/*
class Article{
    //Mark: Properties
    let author: String
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let imageData: Data
    
    
    init(author: String, title: String, description: String, url: String, urlToImage: String, publishedAt: String, imageData: Data) {
        self.author = author
        self.title = title
        self.description = description
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
        self.imageData = imageData
    }
}
 */

class Article{
    //Mark: Properties
    let author: String
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    
    
    init(author: String, title: String, description: String, url: String, urlToImage: String, publishedAt: String) {
        self.author = author
        self.title = title
        self.description = description
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
    }
}
