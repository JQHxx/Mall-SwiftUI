//
//  CycleScrollView.swift
//  SwiftUIKit
//
//  Created by OFweek01 on 2021/6/3.
//

import SwiftUI
import SDCycleScrollView

struct CycleScrollView: UIViewRepresentable {
    
    var imagesURLs: [String]
    var clickAction: ((Int) -> ())?
    
    func updateUIView(_ uiView: SDCycleScrollView, context: Context) {
        uiView.imageURLStringsGroup = imagesURLs
    }
    
    func makeUIView(context: Context) -> SDCycleScrollView {
        let cycleScrollView = SDCycleScrollView()
        cycleScrollView.delegate = context.coordinator
        cycleScrollView.imageURLStringsGroup = imagesURLs
        return cycleScrollView
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(clickAction)
    }
    
    class Coordinator: NSObject, SDCycleScrollViewDelegate {
        var clickAction: ((Int) -> ())?
        init(_ clickAction: ((Int) -> ())?) {
            self.clickAction = clickAction
        }
        
        func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
            if let _ = clickAction {
                clickAction!(index)
            }
        }
    }
}


