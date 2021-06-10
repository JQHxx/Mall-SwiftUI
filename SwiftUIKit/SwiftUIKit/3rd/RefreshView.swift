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
    @Binding var isNoMoreData: Bool
    @Binding var isPullUp: Bool
    let pullDownAction: (() -> Void)?
    let pullUpAction: (() -> Void)?
    
    init(isPullDown: Binding<Bool> = Binding<Bool>.constant(false),
         isPullUp: Binding<Bool> = Binding<Bool>.constant(false),
         isNoMoreData: Binding<Bool> = Binding<Bool>.constant(false),
         pullDownAction: (() -> Void)? = nil,
         pullUpAction: (() -> Void)? = nil) {
        _isPullDown = isPullDown
        _isPullUp = isPullUp
        _isNoMoreData = isNoMoreData
        self.pullDownAction = pullDownAction
        self.pullUpAction = pullUpAction
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            guard let viewHost = uiView.superview?.superview else {
                return
            }
            guard let scrollView = self.scrollView(root: viewHost) else {
                return
            }
            
            if let _ = scrollView.mj_header {
                if self.isPullDown {
                    if let _ = scrollView.mj_footer {
                        context.coordinator.resetNoMoreData()
                        scrollView.mj_footer?.resetNoMoreData()
                    }
                    scrollView.mj_header?.beginRefreshing()
                } else {
                    scrollView.mj_header?.endRefreshing()
                }
            } else {
                if let _ = pullDownAction {
                    scrollView.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
                        context.coordinator.onPullDownAction()
                        pullDownAction!()
                    })
                    scrollView.mj_header?.isCollectionViewAnimationBug = true                    
                }
            }
            
            
            if let _ = scrollView.mj_footer {
                if self.isPullUp {
                    scrollView.mj_footer?.beginRefreshing()
                } else {
                    scrollView.mj_footer?.endRefreshing()
                    if isNoMoreData {
                        scrollView.mj_footer?.endRefreshingWithNoMoreData()
                    }
                }
            } else {
                if let _ = pullUpAction {
                    scrollView.mj_footer = MJRefreshBackNormalFooter.init(refreshingBlock: {
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
        return Coordinator($isPullDown, $isPullUp, $isNoMoreData)
    }
    
    class Coordinator {
        let isPullDown: Binding<Bool>
        let isPullUp: Binding<Bool>
        let isNoMoreData: Binding<Bool>
        
        init(_ isPullDown: Binding<Bool>, _ isPullUp: Binding<Bool>, _ isNoMoreData: Binding<Bool>) {
            self.isPullDown = isPullDown
            self.isPullUp = isPullUp
            self.isNoMoreData = isNoMoreData
        }
        
        @objc
        func onPullDownAction() {
            isPullDown.wrappedValue = true
        }
        
        @objc
        func onPullUpAction() {
            isPullUp.wrappedValue = true
        }
        
        @objc
        func resetNoMoreData() {
            isNoMoreData.wrappedValue = false
        }
    }
    
    private func scrollView(root: UIView) -> UIScrollView? {
        for subview in root.subviews {
            //print(subview.self)
            if subview.isKind(of: UIScrollView.self) {
                return subview as? UIScrollView
            } else if let scrollView = scrollView(root: subview) {
                return scrollView
            }
        }
        return nil
    }
}

extension View {
    /**
     * 注意：addRefreshHeader 和 addRefreshFooter 不能同时使用， 两个都要使用addRefresh
     */
    func addRefreshHeader(isRefreshing: Binding<Bool>,
                          action: (() -> Void)? = nil) -> some View {
        self.background(RefreshView.init(isPullDown: isRefreshing, pullDownAction: action))
        
    }
    
    func addRefreshFooter(isLoadingMore: Binding<Bool>,
                          isNoMoreData: Binding<Bool>,
                          action: (() -> Void)? = nil) -> some View {
        self.background(RefreshView.init(isPullUp: isLoadingMore, isNoMoreData: isNoMoreData, pullUpAction: action))
        
    }
    
    func addRefresh(isPullDown: Binding<Bool>,
                     isPullUp: Binding<Bool>,
                     isNoMoreData: Binding<Bool>,
                     pullDownAction: (() -> Void)? = nil,
                     pullUpAction: (() -> Void)? = nil ) -> some View {
        self.background(RefreshView.init(isPullDown: isPullDown, isPullUp: isPullUp, isNoMoreData: isNoMoreData,  pullDownAction: pullDownAction, pullUpAction: pullDownAction))
    }
}
