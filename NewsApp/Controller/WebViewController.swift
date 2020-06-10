//
//  WebViewController.swift
//  NewsApp
//
//  Created by William Yeung on 6/10/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    // MARK: - Properties
    var webView: WKWebView!
    var selectedArticle: Article!
    
    private let activityIndicator: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView()
        ai.translatesAutoresizingMaskIntoConstraints = false
        ai.style = .large
        return ai
    }()
    
    // MARK: - Lifecycle
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        anchorElements()
        loadWebViewPage()
    }
    
    // MARK: - Helper
    func anchorElements() {
        view.addSubview(activityIndicator)
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    }
    
    func loadWebViewPage() {
        if let siteUrlString = selectedArticle.url {
            let url = URL(string: siteUrlString)!
            let urlRequest = URLRequest(url: url)
            webView.load(urlRequest)
        }
    }
}

// MARK: - WKNavigation delegate methods
extension WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        activityIndicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        activityIndicator.stopAnimating()
    }
}
