//
//  UIKitTabView.swift
//  SwiftUI_Jike
//
//  Created by OFweek01 on 2021/5/21.
//  Copyright © 2021 alexyang. All rights reserved.
//

import SwiftUI


/*
UIKitTabView([
    UIKitTabView.Tab(view: NavView(), title: "首页", image: "phone32.png"),
    UIKitTabView.Tab(view: Text("Second View"), title: "其他", image: "")
])
 */

struct UIKitTabView: View {
    var viewControllers: [UIHostingController<AnyView>]
    @State var selectedIndex: Int = 0
    
    init(_ views: [Tab]) {
        self.viewControllers = views.map {
            let host = UIHostingController(rootView: $0.view)
            host.tabBarItem = $0.barItem
            return host
        }
    }
    
    var body: some View {
        TabBarController(controllers: viewControllers, selectedIndex: $selectedIndex)
            .edgesIgnoringSafeArea(.all)
    }
    
    struct Tab {
        var view: AnyView
        var barItem: UITabBarItem
        
        init<V: View>(view: V, barItem: UITabBarItem) {
            self.view = AnyView(view)
            self.barItem = barItem
        }
        
        // convenience
        init<V: View>(view: V, title: String?, image: String, selectedImage: String? = nil) {
            let selectedImage = selectedImage != nil ? UIImage(named: selectedImage!) : nil
            let barItem = UITabBarItem(title: title, image: UIImage(named: image), selectedImage: selectedImage)
            self.init(view: view, barItem: barItem)
        }
    }
}
