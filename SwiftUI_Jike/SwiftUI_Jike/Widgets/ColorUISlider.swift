//
//  ColorUISlider.swift
//  SwiftUI_Jike
//
//  Created by OFweek01 on 2021/5/20.
//  Copyright © 2021 alexyang. All rights reserved.
//

import SwiftUI
import UIKit

struct ColorUISlider: UIViewRepresentable {
    //  直接给这个ColorUISlider添加属性，通过struct的默认构造函数 ColorUISlider(color: .red, value: .constant(0.5))
    var color: UIColor
    @Binding var value: Double
    
    // typealias UIViewType = UISlider指定了需要包装的UIView的类型，make方法要求返回UIView的实例，这里无需指定该view的frame或约束
    typealias UIViewType = UISlider
    
    func makeUIView(context: UIViewRepresentableContext<ColorUISlider>) -> UISlider {
        let slider = UISlider(frame: .zero)
        slider.thumbTintColor = color
        slider.value = Float(value)
        slider.addTarget(context.coordinator, action: #selector(Coordinator.valueChanged(_:)), for: .valueChanged)
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: UIViewRepresentableContext<ColorUISlider>) {
        uiView.value = Float(value)
    }
    
    // 内部类 ColorUISlider如何影响其父view呢？我们看到了这个@Binding参数@Binding var value: Double（一个引用类型，如果不记得了可以查阅之前的一篇文章Data Binding），但Binding是没有办法在UIView中直接使用的，还需另一个类，Coordinator
    class Coordinator: NSObject {
        var value: Binding<Double>
        init(value: Binding<Double>) {
            self.value = value
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            self.value.wrappedValue = Double(sender.value)
        }
    }
    // UIViewRepresentable的另一个方法makeCoordinator
    func makeCoordinator() -> ColorUISlider.Coordinator {
        return Coordinator(value: $value)
    }
}
