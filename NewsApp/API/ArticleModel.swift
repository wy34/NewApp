//
//  ArticleModel.swift
//  NewsApp
//
//  Created by William Yeung on 6/9/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import Foundation

protocol ArticleModelProtocol {
    func articlesRetrieved(_ articles: [Article])
}

class ArticleModel {
    var delegate: ArticleModelProtocol?
    
    func getArticles() {
        let stringUrl = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=5e0985f939da46e1a5ce85039923a1aa"
        
        let url = URL(string: stringUrl)
        
        guard url != nil else {
            print("could not create url object")
            return
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
                
                let decoder = JSONDecoder()
                
                do {
                    let articleService = try decoder.decode(ArticleService.self, from: data!)
                    let articles = articleService.articles!
                    DispatchQueue.main.async {
                        self.delegate?.articlesRetrieved(articles)
                    }
                } catch {
                    print("Error parsing json")
                }
                
            }
        }
        dataTask.resume()
    }
}
