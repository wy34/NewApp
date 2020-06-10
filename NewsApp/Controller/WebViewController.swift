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
    
    // MARK: - Lifecycle
    override func loadView() {
        webView = WKWebView()
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
