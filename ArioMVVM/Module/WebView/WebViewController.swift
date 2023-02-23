//
//  WebViewController.swift
//  ArioMVVM
//
//  Created by Muhammad ario bagus on 24/02/23.
//

import Foundation
import WebKit

class WebViewController: BaseViewController {
    
    var webView: WKWebView!
    var url: String?
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let urlString = self.url, let url = URL(string: urlString) else { return }
        webView.load(URLRequest(url: url))
        
        // create refresh button
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        toolbarItems = [refresh]
        navigationController?.isToolbarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isToolbarHidden = true
    }
}

extension WebViewController: WKNavigationDelegate {
    
}
