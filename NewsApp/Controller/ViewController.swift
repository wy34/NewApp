//
//  ViewController.swift
//  NewsApp
//
//  Created by William Yeung on 6/9/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit

private let reuseIdentifier = "MainTableViewCell"

class ViewController: UIViewController {
    // MARK: - Properties
    var model = ArticleModel()
    var articles = [Article]()
    
    private let mainTable: UITableView = {
        let tv = UITableView()
        tv.register(ArticleCell.self, forCellReuseIdentifier: reuseIdentifier)
        return tv
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        anchorElements()
        mainTable.delegate = self
        mainTable.dataSource = self
        model.delegate = self
        model.getArticles()
    }

    // MARK: - Helpers
    func anchorElements() {
        view.addSubview(mainTable)
        mainTable.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
    }
}

// MARK: - UITableView delegate methods
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ArticleCell
        cell.articleToDisplay = articles[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcToGoTo = WebViewController()
    }
}

// MARK: - ArticleModel Delegate methods
extension ViewController: ArticleModelProtocol {
    func articlesRetrieved(_ articles: [Article]) {
        self.articles = articles
        mainTable.reloadData()
    }
}
