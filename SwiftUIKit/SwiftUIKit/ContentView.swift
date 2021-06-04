//
//  ContentView.swift
//  SwiftUIKit
//
//  Created by OFweek01 on 2021/6/3.
//

import SwiftUI
import InterfaceKit

struct ContentView: View {
    
    var titles = ["测试1", "测试1", "测试1", "测试1", "测试1"]
    @State var selectIndex: Int = 0
    
    @State var isHeaderRefresh: Bool = true
    
    let myView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.orange
        return view
    }()
    
    var body: some View {
        
        //InterfaceView(self.myView)
        /*
        VStack(alignment: .leading) {
            VStack(alignment: .center) {
                JXSView.init(titles: titles, selectedIndex: $selectIndex).frame(height: 30)
                Divider().frame(height: 1)
                Text("\(selectIndex)").frame(height: UIScreen.main.bounds.height - 31)
            }
        }.navigationBarHidden(true)
        .edgesIgnoringSafeArea(.bottom)
 */
        ListView()
        //WebView_Test()
        
        //SegmentControl(titles: titles, selectedSegmentIndex: $selectIndex)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
