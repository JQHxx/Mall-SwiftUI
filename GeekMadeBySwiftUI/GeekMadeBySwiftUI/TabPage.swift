//
//  TabPage.swift
//  GeekMadeBySwiftUI
//
//  Created by OFweek01 on 2021/6/2.
//  Copyright © 2021 xgf. All rights reserved.
//

import SwiftUI
import JXSegmentedView

struct TabPage: View {
    
    @State var selectIndex = -1
    @State var titles =  ["关注", "推荐", "热榜","抗疫","要闻","新时代","视频","热点"]
    
    var body: some View {
        VStack {
            //JXSView()
        }
    }
}

struct TabPage_Previews: PreviewProvider {
    static var previews: some View {
        TabPage()
    }
}
