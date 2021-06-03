//
//  NavigationViewController.swift
//  SwiftUIKit
//
//  Created by OFweek01 on 2021/6/3.
//

import SwiftUI
import UIKit

struct NavigationViewController: UIViewControllerRepresentable {
    
    var vc: UIViewController
    var title: String

    func makeUIViewController(context: Context) -> UINavigationController {
        
        let nvc = UINavigationController(rootViewController: vc)
        nvc.delegate = context.coordinator
        return nvc
    }

    func updateUIViewController(_ navigationController: UINavigationController, context: Context) {
        navigationController.viewControllers[0].title = title
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate {
        var parent: NavigationViewController
        
        init(_ parent: NavigationViewController) {
            self.parent = parent
        }
    }
}


//struct ContentView : View {
//
//    var body: some View {
//        NavigationViewController(vc: UIViewController(), title: "UIViewControllerRepresentable")
//    }
//}
