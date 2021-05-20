//
//  WebView.swift
//  SwiftUI_Jike
//
//  Created by OFweek01 on 2021/5/20.
//  Copyright © 2021 alexyang. All rights reserved.
//

import SwiftUI
//首先导入需要使用到的WebKit框架。
import WebKit

//使当前的结构体遵循UIViewRepresentable协议。使用该协议的实例，可以在SwiftUI中创建和管理UIView对象。
struct CWebView : UIViewRepresentable {
    
    let url: String
    
    //typealias UIViewType = WKWebView
    
    //实现协议里的makeUIView方法，用来初始化并返回一个WKWebView网页视图对象。
    func makeUIView(context: UIViewRepresentableContext<CWebView>) -> WKWebView {
        return WKWebView()
    }
    
    //接着实现协议里的updatedUIView方法，用来设置网页视图需要加载的网址参数。
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<CWebView>) {
        //初始化一个URLRequest对象，作为网页视图的网址。
        let request = URLRequest(url:URL(string: url)!)
        //通过load方法，使网页视图加载该网址对应的网页。
        uiView.load(request)
    }
}
