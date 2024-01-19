//
//  WebView.swift
//  HackYou
//
//  Created by Sweda Thiyagarajan on 27/10/2021.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let availbleURL = urlString {
            if let url = URL(string: availbleURL) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(urlString: "https://google.com")
    }
}
