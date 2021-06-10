//
//  SwiftUIIndex.swift
//  SwiftUIKit
//
//  Created by OFweek01 on 2021/6/8.
//

import Foundation
import SwiftUI

struct NavigationTransition: ViewModifier {
    @EnvironmentObject private var navigator: Navigator
    
    func body(content: Content) -> some View {
        content
            .animation(.easeInOut)
            .transition(
                navigator.lastAction?.direction == .deeper || navigator.lastAction?.direction == .sideways
                    ? AnyTransition.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
                    : AnyTransition.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing))
            )
    }
}

extension View {
    func navigationTransition() -> some View {
        modifier(NavigationTransition())
    }
}

/*
Route(path: "news") {
    HomeView()
}
.navigationTransition()

SwitchRoutes {
    Route(path: "news/:id", validator: newsIdValidator) { uuid in
        NewsItemScreen(uuid: uuid)
    }
    Route(path: "news") {
        NewsScreen()
    }
    Route {
        HomeScreen()
    }
}
.navigationTransition()
 */
