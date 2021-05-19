//
//  ContentView.swift
//  SwiftUI_Jike
//
//  Created by alexyang on 2019/6/5.
//  Copyright © 2019 alexyang. All rights reserved.
//

import SwiftUI
import struct Kingfisher.KFImage

struct ContentView : View {
	@State var currentPage = 0
	let segItems: [String] = ["关注", "推荐", "附近", "即刻合伙人"]
    var body: some View {
//		GYTabView(views:
//					[AnyView(HomeView()),
//					 AnyView(ActivityView()),
//					 AnyView(ChatView()),
//					 AnyView(SettingView())],
//				  tabItems: DataMgr.shared.getTabItems())
//			.edgesIgnoringSafeArea(.top)
		
		KFImage(URL(string: "https://is2-ssl.mzstatic.com/image/thumb/Purple124/v4/a7/32/8c/a7328c6d-247e-578e-64fb-666ba3990947/source/512x512bb.jpg")!)


    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
		ContentView()
		
    }
}
#endif
