//
//  ArticleService.swift
//  NewsApp
//
//  Created by William Yeung on 6/9/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import Foundation

struct ArticleService: Decodable {
    var totalResults: Int?
    var articles: [Article]?
}
