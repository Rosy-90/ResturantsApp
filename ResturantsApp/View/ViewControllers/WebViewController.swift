//
//  WebViewController.swift
//  ResturantsApp
//
//  Created by Rosy Patel on 28/02/2023.
//

import UIKit
import WebKit

class WebViewController: UINavigationController, WKNavigationDelegate {
    
    private lazy var webView: WKWebView = {
        let webView = WKWebView(frame: .zero)
        webView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(webView)
        webView.navigationDelegate = self
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadWeb()
    }
    
    private func loadWeb() {
        guard let url = NetworkURLs.webPage.url else { return }
        self.webView.load(URLRequest(url: url))
    }
}
