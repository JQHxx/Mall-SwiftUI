//
//  ActivityIndicator.swift
//  SwiftUIKit
//
//  Created by OFweek01 on 2021/6/3.
//
import SwiftUI
import UIKit

struct ActivityIndicator: UIViewRepresentable {
    var isAnimating: Bool
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let v = UIActivityIndicatorView()
        v.color = .orange
        return v
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        if isAnimating {
            uiView.startAnimating()
        } else {
            uiView.stopAnimating()
        }
    }
}


//struct ContentView : View {
//
//    var isAnimating: Bool = true
//
//    var body: some View {
//        ActivityIndicator(isAnimating: isAnimating)
//    }
//}
