//
//  MyHontingController.swift
//  SwiftUIKit
//
//  Created by OFweek01 on 2021/6/3.
//

import SwiftUI

class MyHontingController: UIHostingController<AnyView> {
    var statusBarStyle: UIStatusBarStyle = .default {
        didSet {
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }
    @objc override var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle
    }
}
