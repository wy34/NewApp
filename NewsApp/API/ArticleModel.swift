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
        
        
        
        
        delegate?.articlesRetrieved([Article]())
    }
}
