//
//  ContentView.swift
//  SwiftUI_Jike
//
//  Created by alexyang on 2019/6/5.
//  Copyright © 2019 alexyang. All rights reserved.
//

import SwiftUI
import struct Kingfisher.KFImage
import Introspect

struct ContentView : View {
	//@State var currentPage = 0
	private var spinner: Spinner { Spinner(isAnimating: true, style: .large) }
	var body: some View {
		//CWebView(url: "https://www.baidu.com").eraseToAnyView()
		//spinner.eraseToAnyView()
		
		/*
		UIKitTabView([
			UIKitTabView.Tab(view: AnyView(HomeView()), title: "首页", image: "phone32.png"),
			UIKitTabView.Tab(view: Text("Second View"), title: "其他", image: "")
		])
		*/
		GYTabView(views:
					[AnyView(HomeView()),
					 AnyView(ActivityView()),
					 AnyView(ChatView()),
					 AnyView(SettingView())],
				  tabItems: DataMgr.shared.getTabItems())
			.edgesIgnoringSafeArea(.top)
		
		//		KFImage(URL(string: "https://is2-ssl.mzstatic.com/image/thumb/Purple124/v4/a7/32/8c/a7328c6d-247e-578e-64fb-666ba3990947/source/512x512bb.jpg")!).placeholder{Image("logo")}.loadDiskFileSynchronously()
		
		
		//		KFImage(URL(string: "https://is2-ssl.mzstatic.com/image/thumb/Purple124/v4/a7/32/8c/a7328c6d-247e-578e-64fb-666ba3990947/source/512x512bb.jpg"))
		//			.resizable()
		//			.scaledToFill()
		//			.clipped()
		//			.frame(width: 120, height: 120)
		//			.cornerRadius(120 / 2)
		//			.shadow(color: .black, radius: 6, x: 0.0, y: 0.0)
		
		
	}
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
	static var previews: some View {
		ContentView()
		
	}
}
#endif
