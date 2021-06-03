//
//  WebView_Test.swift
//  SwiftUIKit
//
//  Created by OFweek01 on 2021/6/3.
//

import SwiftUI
import Combine

class WebViewModelObject: ObservableObject {
    @Published var isPullDown: Bool = false {
        didSet {
            if isPullDown {
                //isPullDown = false
            }
        }
    }
}

struct WebView_Test: View {
    @ObservedObject var modelObject = WebViewModelObject()
    var body: some View {
        WebView.init(redirect: "https://www.baidu.com").background(RefreshView.init(isPullDown: $modelObject.isPullDown, pullDownAction: {
            $modelObject.isPullDown.wrappedValue = false
        }))
    }
}

struct WebView_Test_Previews: PreviewProvider {
    static var previews: some View {
        WebView_Test()
    }
}
