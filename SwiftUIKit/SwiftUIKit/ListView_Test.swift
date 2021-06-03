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
    
    func requestData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.isPullDown = false
        }
    }
    
    func requestMoreData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.isPullUp = false
        }
    }
}

struct ListView: View {
    @ObservedObject var modelObject = ModelObject()
    
    var array = ["a","b","c","d","e","f","g","b","c","d","e","f","g","b","c","d","e","f","g","b","c","d","e","f","g"]
    
    init() {
        // To remove only extra separators below the list:
        //UITableView.appearance().tableHeaderView = UIView()
        
        // To remove all separators including the actual ones:
        //UITableView.appearance().separatorStyle = .none
    }


    
    var body: some View {
        NavigationView {
          List(array, id: \.self) { text in
            Text(text)
          }
          .background(RefreshView.init(isPullDown: $modelObject.isPullDown, isPullUp: $modelObject.isPullUp, pullDownAction: {

          }, pullUpAction: {

          }))
          .navigationBarHidden(false)
          .navigationBarTitle("刷新demo", displayMode: .inline)
          .edgesIgnoringSafeArea(.all)
          .background(NavigationConfigurator(configure: { nav in
                      nav.navigationBar.barTintColor = .white
                      nav.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.purple]
                  }))
        }.onAppear(perform: {
            let controller = UIApplication.shared.windows[0].rootViewController as? MyHontingController
            controller?.statusBarStyle = .lightContent
        })
    }
}
