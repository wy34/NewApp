//
//  ViewController.swift
//  NewsApp
//
//  Created by William Yeung on 6/9/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    var model = ArticleModel()
    var articles = [Article]()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        model.delegate = self
        model.getArticles()
    }

    // MARK: - Helpers
}


// MARK: - ArticleModel Delegate methods
extension ViewController: ArticleModelProtocol {
    func articlesRetrieved(_ articles: [Article]) {
        self.articles = articles
    }
}
