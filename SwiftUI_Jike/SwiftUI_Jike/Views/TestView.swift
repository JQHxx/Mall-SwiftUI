//
//  TestView.swift
//  SwiftUI_Jike
//
//  Created by alexyang on 2019/6/12.
//  Copyright © 2019 alexyang. All rights reserved.
//

import SwiftUI

struct TestView : View {
    var body: some View {
        NavigationView {
            Text("hahah")
        }.onAppear(perform: {
        }).edgesIgnoringSafeArea(.all)
    }
}

#if DEBUG
struct TestView_Previews : PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
#endif
