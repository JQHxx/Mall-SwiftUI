//
//  RefreshView.swift
//  SwiftUIKit
//
//  Created by OFweek01 on 2021/6/3.
//

import SwiftUI
import MJRefresh

struct RefreshView: UIViewRepresentable {
    
    @Binding var isPullDown: Bool
    @Binding var isPullUp: Bool
    let pullDownAction: (() -> Void)?
    let pullUpAction: (() -> Void)?
    
    init(isPullDown: Binding<Bool>, isPullUp: Binding<Bool>, pullDownAction: (() -> Void)? = nil, pullUpAction: (() -> Void)? = nil) {
        _isPullDown = isPullDown
        _isPullUp = isPullUp
        self.pullDownAction = pullDownAction
        self.pullUpAction = pullUpAction
    }
    
    
    func updateUIView(_ uiView: UIView, context: Context) {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            guard let viewHost = uiView.superview?.superview else {
                return
            }
            guard let tableView = self.tableView(root: viewHost) else {
                return
            }
            
            if let _ = tableView.mj_header {
                if self.isPullDown {
                    tableView.mj_header?.beginRefreshing()
                } else {
                    tableView.mj_header?.endRefreshing()
                }
            } else {
                if let _ = pullDownAction {
                    tableView.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
                        context.coordinator.onPullDownAction()
                        pullDownAction!()
                    })
                }
            }
            
            
            if let _ = tableView.mj_footer {
                if self.isPullUp {
                    tableView.mj_footer?.beginRefreshing()
                } else {
                    tableView.mj_footer?.endRefreshing()
                }
            } else {
                if let _ = pullUpAction {
                    tableView.mj_footer = MJRefreshBackNormalFooter.init(refreshingBlock: {
                        context.coordinator.onPullUpAction()
                        pullUpAction!()
                    })
                }
            }
        }
    }
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        return view
    }
    
    func makeCoordinator() -> Coordinator {
         return Coordinator($isPullDown, $isPullUp)
     }
     
     class Coordinator {
         let isPullDown: Binding<Bool>
         let isPullUp: Binding<Bool>
         
         init(_ isPullDown: Binding<Bool>, _ isPullUp: Binding<Bool>) {
             self.isPullDown = isPullDown
             self.isPullUp = isPullUp
         }

         @objc
         func onPullDownAction() {
            isPullDown.wrappedValue = true
         }
        
        @objc
        func onPullUpAction() {
           isPullUp.wrappedValue = true
        }
     }
    
    private func tableView(root: UIView) -> UITableView? {
        for subview in root.subviews {
            if subview.isKind(of: UITableView.self) {
                return subview as? UITableView
            } else if let tableView = tableView(root: subview) {
                return tableView
            }
        }
        return nil
    }
}
