//
//  WebView.swift
//  SwiftUIKit
//
//  Created by OFweek01 on 2021/6/3.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    var redirect : String?
    
    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }
    
    // redirect 重新赋值就会调用
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: redirect ?? "") {
            uiView.load(URLRequest.init(url: url))
        }
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView()
    }
}
