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
    @State var isActive = false
    
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
        /*
         NavigationView {
         AnyView(Test1TableView.init(titles)).navigationTitle("测试")
         }
         */
        
        NavigationView {
            VStack {
                GeometryReader { geometry in
                    TableView(
                        animated: false,
                        snapshot: self.snapshot(),
                        configureUIView: self.configureTableview,
                        row: { self.row(with: $0, geometry: geometry) }
                    )
                    .edgesIgnoringSafeArea(.all)
                    .navigationViewStyle(StackNavigationViewStyle())
                    .navigationBarTitle("测试TableView")
                }
            }
        }
        
    }
    
    struct Section: Hashable {}
    
    struct Row: Hashable {
        var title: String = ""
    }
    
    func row(with row: Row, geometry: GeometryProxy) -> some View {
        NavigationLink.init(destination: HomeView(), isActive: $isActive) {
            Text(row.title).onTapGesture {
                //每次打印isActive都是false,说明这是一个状态位标识
                print(self.isActive)
                self.isActive = true
            }
        }
    }
    
    func snapshot() -> NSDiffableDataSourceSnapshot<Section, Row> {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Row>()
        snapshot.appendSections([Section()])
        snapshot.appendItems([Row.init(title: "items"), Row.init(title: "items1"), Row.init(title: "items2"), Row.init(title: "items3")])
        return snapshot
    }
    
    func configureTableview(_ tableView: UITableView) {
        let tableHeaderView = UIHostingController(
            rootView: Text("table header")
        )
        tableHeaderView.view.backgroundColor = .clear
        tableHeaderView.view.sizeToFit()
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = .none
        tableView.insetsContentViewsToSafeArea = false
        tableView.keyboardDismissMode = .onDrag
        tableView.estimatedRowHeight = 100
        tableView.tableHeaderView = tableHeaderView.view
        tableView.tableFooterView = UIView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
