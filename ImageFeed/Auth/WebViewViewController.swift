//
//  WebViewViewController.swift
//  ImageFeed
//
//  Created by KraSSavchiK on 24.02.2024.

import UIKit
import WebKit

fileprivate let UnsplashAuthorizeURLString = "https://unsplash.com/oauth/authorize"

// MARK: - Protocol
protocol WebViewViewControllerDelegate:AnyObject {
    // WebViewViewController получил код
    func webViewViewController(_ vc:WebViewViewController,didAuthenticateWithCode code: String)
    // убираем с экрана WebViewViewController
    func webViewViewControllerDidCancel(_ vc:WebViewViewController)
}


final class WebViewViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet private var webView: WKWebView!
    @IBOutlet private var progressView: UIProgressView!
    
    
    weak var delegate: WebViewViewControllerDelegate?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAuthView()
        webView.navigationDelegate = self
    }
    
    // MARK: - Private Methods
    //формирование URL из компонентов
    private func loadAuthView() {
        guard var urlComponents = URLComponents(string: UnsplashAuthorizeURLString) else {
            print("Error while implementing URLComponents")
            return
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: AccessKey),
            URLQueryItem(name: "redirect_uri", value: RedirectURI),
            URLQueryItem(name: "response_type", value: "code"),
            URLQueryItem(name: "scope", value: AccessScope)
        ]
        
        guard let url = urlComponents.url else {
            print("Error while implementing URLComponents.url")
            return
        }
        
        let request = URLRequest(url: url)
        webView.load(request)
        
    }
}

//MARK: - Extension
//узнаём об успешной авторизации пользователя 
extension WebViewViewController: WKNavigationDelegate {
    func webView(
        _ webView: WKWebView,
        decidePolicyFor navigationAction: WKNavigationAction,
        decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let code = code(from: navigationAction) {
            //TODO: - process code
            delegate?.webViewViewController(self, didAuthenticateWithCode: code)
            decisionHandler(.cancel)
        } else {
            decisionHandler(.allow)
        }
    }
    
    // возвращает код авторизаци,если он получен
    private func code(from navigationAction: WKNavigationAction) -> String? {
        if
            let url = navigationAction.request.url,
            let urlComponents = URLComponents(string: url.absoluteString),
            urlComponents.path == "/oauth/authorize/native",
            let items = urlComponents.queryItems,
            let codeItem = items.first(where: { $0.name == "code"})
        {
            return codeItem.value
        } else {
            return nil
        }
    }
}





