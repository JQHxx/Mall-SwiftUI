//
//  PageControl.swift
//  SwiftUIKit
//
//  Created by OFweek01 on 2021/6/3.
//

import SwiftUI

struct PageControl: UIViewRepresentable {
    var numberOfPages : Int
    @Binding var currentPage : Int
    
    func makeUIView(context: Context) -> UIPageControl {
        let c = UIPageControl.init()
        c.numberOfPages = numberOfPages
        return c
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
}

