//
//  UnderLine.swift
//  SwiftUIKit
//
//  Created by OFweek01 on 2021/6/7.
//

import SwiftUI
import UIKit

/*
TextField("请输入手机号", text: $userName)
                        .textFieldStyle(UnderLineTextFieldStyle())
                        .keyboardType(.numberPad)
 */

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct UnderLineTextFieldStyle : TextFieldStyle {
    public func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .font(.callout)
            .padding(.bottom, 10)
            .background(
                UnderLine()
                    .stroke(Color.init(red: 238/255.0, green: 238/255.0, blue: 238/255.0), lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                    .frame(alignment: .bottom)
            )
    }
}

struct UnderLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        return path
    }
}
