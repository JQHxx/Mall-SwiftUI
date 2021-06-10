//
//  ListView_Test1.swift
//  SwiftUIKit
//
//  Created by OFweek01 on 2021/6/10.
//

import SwiftUI
import Combine
import UIKit


class ModelObject1: ObservableObject {
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
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.isPullDown = false
        }
    }
    
    func requestMoreData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.isPullUp = false
            self.isNoMoreData = true
        }
    }
}

struct ListViewTest1: View {
    
    @ObservedObject var modelObject = ModelObject1()
    let array = ["1","2","1","1","1","1","1","1","1","1","1","1",]

    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack {
                        ForEach(array, id:\.self) { text in
                            
                            NavigationLink.init(destination: HomeView()) {
                                VStack {
                                    HStack {
                                        Text(text).background(Color.orange)
                                        Spacer().background(Color.orange)
                                    }
                                    Divider()
                                }.listRowInsets(EdgeInsets())
                            }
                            
                            
                        }
                    }
                }
                .background(RefreshView.init(isPullDown: $modelObject.isPullDown, isPullUp: $modelObject.isPullUp, isNoMoreData: $modelObject.isNoMoreData, pullDownAction: {
                    
                }, pullUpAction: {
                    
                }))
            }.navigationBarTitle("测试", displayMode: NavigationBarItem.TitleDisplayMode.inline)
        }
    }
}

struct ListViewTest1_Previews: PreviewProvider {
    static var previews: some View {
        ListViewTest1()
    }
}
