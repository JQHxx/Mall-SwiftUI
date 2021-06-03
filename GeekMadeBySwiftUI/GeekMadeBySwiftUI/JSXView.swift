//
//  JSXView.swift
//  GeekMadeBySwiftUI
//
//  Created by OFweek01 on 2021/6/2.
//  Copyright © 2021 xgf. All rights reserved.
//

import SwiftUI
import JXSegmentedView

struct TabBarController: UIViewControllerRepresentable {
    var controllers: [UIViewController]
    @Binding var selectedIndex: Int
    
    func makeUIViewController(context: Context) -> UITabBarController {
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = controllers
        tabBarController.delegate = context.coordinator
        tabBarController.selectedIndex = 0
        return tabBarController
    }
    
    func updateUIViewController(_ uiViewController: UITabBarController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UITabBarControllerDelegate {
        var parent: TabBarController
        init(_ tabBarController: TabBarController) {
            self.parent = tabBarController
        }
        
        func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
            parent.selectedIndex = tabBarController.selectedIndex
        }
    }
}


/*
struct JSXView: UIViewRepresentable {
    var titles: [String]
    @Binding var selectedIndex: Int
    
    func updateUIView(_ uiView: JXSegmentedView, context: Context) {
        
    }
    
    func makeUIView(context: Context) -> JXSegmentedView {
        let segmentedView = JXSegmentedView()
        segmentedView.delegate = context.coordinator
        return segmentedView
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, JXSegmentedViewDelegate {
        var parent: JSXView
        init(_ jsxView: JSXView) {
            self.parent = jsxView
        }
        
        func segmentedView(_ segmentedView: JXSegmentedView, didSelectedItemAt index: Int) {
            parent.selectedIndex = index
        }
    }
}
 */



