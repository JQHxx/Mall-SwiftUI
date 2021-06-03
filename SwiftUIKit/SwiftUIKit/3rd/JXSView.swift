//
//  JXSView.swift
//  SwiftUIKit
//
//  Created by OFweek01 on 2021/6/3.
//

import SwiftUI
import JXSegmentedView

struct JXSView: UIViewRepresentable {
    
    var titles: [String]
    @Binding var selectedIndex: Int
    
    private let segmentedDataSource = JXSegmentedTitleDataSource()
    

    func updateUIView(_ uiView: JXSegmentedView, context: Context) {
        
    }

    func makeUIView(context: Context) -> JXSegmentedView {
        //1、初始化JXSegmentedView
        let segmentedView = JXSegmentedView()
        segmentedView.delegate = context.coordinator
        segmentedView.defaultSelectedIndex = selectedIndex

        //2、配置数据源
        segmentedDataSource.titles = titles
        segmentedDataSource.isTitleColorGradientEnabled = true
        segmentedView.dataSource = segmentedDataSource

        //3、配置指示器
        let indicator = JXSegmentedIndicatorLineView()
        indicator.indicatorWidth = JXSegmentedViewAutomaticDimension
        indicator.lineStyle = .lengthen
        segmentedView.indicators = [indicator]
        
        return segmentedView
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, JXSegmentedViewDelegate {
        var parent: JXSView
        
        init(_ parent: JXSView) {
            self.parent = parent
        }
        
        func segmentedView(_ segmentedView: JXSegmentedView, didSelectedItemAt index: Int) {
            parent.selectedIndex = index
        }
    }

}

//struct JXSView_Previews: PreviewProvider {
//    static var previews: some View {
//        JXSView()
//    }
//}
