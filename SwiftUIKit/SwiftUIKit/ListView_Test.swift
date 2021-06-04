//
//  ListView.swift
//  SwiftUIKit
//
//  Created by OFweek01 on 2021/6/3.
//
import SwiftUI
import Combine
import UIKit

class ModelObject: ObservableObject {
    @Published var isPullDown: Bool = false {
        didSet {
            if isPullDown {
                //刷新发起网络请求
                requestData()
            }
        }
    }
    
    @Published var isPullUp: Bool = false {
        didSet {
            if isPullUp {
                //刷新发起网络请求
                requestMoreData()
            }
        }
    }
    
    @Published var isNoMoreData: Bool = false
    
    func requestData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.isPullDown = false
        }
    }
    
    func requestMoreData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.isPullUp = false
            self.isNoMoreData = true
        }
    }
}

struct ListView: View {
    @ObservedObject var modelObject = ModelObject()
    
    var array = ["a","b","c","d","e","f","g","b","c","d","e","f","g","b","c","d","e","f","g","b","c","d","e","f","g"]
    
    init() {
        //        UITableView.appearance().separatorStyle = .none
        //        //UITableView.appearance().backgroundColor = UIColor.red
        //        //UITableView.appearance().tintColor = UIColor.blue
        //        //UITableView.appearance().separatorColor = .blue
        //        //        去掉点击效果
        //        UITableViewCell.appearance().selectionStyle = .none
        //        //UITableViewCell.appearance().backgroundColor = .yellow
        //        UITableView.appearance().sectionFooterHeight = 10
        //        UITableView.appearance().estimatedRowHeight = 0
        //        UITableView.appearance().estimatedSectionFooterHeight = 0
        //        UITableView.appearance().estimatedSectionHeaderHeight = 0
    }
    
    
    
    var body: some View {
        NavigationView {
            
            List {
                ForEach(array, id:\.self) { text in
                    VStack {
                        HStack {
                            Text(text).background(Color.orange)
                            Spacer().background(Color.orange)
                        }
                        Divider()
                    }.listRowInsets(EdgeInsets())
                    .onTapGesture {
                        print("点击")
                    }
                }
            }
            .background(RefreshView.init(isPullDown: $modelObject.isPullDown, isPullUp: $modelObject.isPullUp, isNoMoreData: $modelObject.isNoMoreData, pullDownAction: {
                
            }, pullUpAction: {
                
            }))
            //.listStyle(SidebarListStyle())
            .navigationBarHidden(false)
            .navigationBarTitle("刷新demo", displayMode: .inline)
            .edgesIgnoringSafeArea(.all)
            .background(NavigationConfigurator(configure: { nav in
                nav.navigationBar.barTintColor = .white
                nav.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.purple]
            }))
        }
        .onAppear(perform: {
            let controller = UIApplication.shared.windows[0].rootViewController as? MyHontingController
            controller?.statusBarStyle = .lightContent
            
        })
    }
}
