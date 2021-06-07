//
//  ContentView.swift
//  SwiftUIKit
//
//  Created by OFweek01 on 2021/6/3.
//

import SwiftUI
import InterfaceKit
import Combine

struct ContentView: View {
    
    @State var titles = ["测试1", "测试2", "测试3", "测试4", "测试5"]
    @State var selectIndex: Int = 0
    
    @State var isHeaderRefresh: Bool = true
    
    let myView: TestTableView = {
        let view = TestTableView.init(frame: CGRect.zero, style: UITableView.Style.plain)
        //view.backgroundColor = UIColor.orange
        return view
    }()
    
    var body: some View {
        
        /* 不能使用跳转
        InterfaceView(self.myView.setup(titles, { str in
            print(str)
        }))
         */
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
        //ListView()
        //WebView_Test()
        
        //SegmentControl(titles: titles, selectedSegmentIndex: $selectIndex)
        NavigationView {
            AnyView(Test1TableView.init(titles)).navigationTitle("测试")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
