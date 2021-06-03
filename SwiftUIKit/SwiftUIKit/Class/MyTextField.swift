//
//  MyTextField.swift
//  SwiftUIKit
//
//  Created by OFweek01 on 2021/6/3.
//
import SwiftUI
import UIKit

// 定义一个类负责实现代理
class TextFieldDelegate: NSObject, UITextFieldDelegate {
        
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("开始编辑")
    }
}

// 定义UIViewRepresentable
struct MyTextField: UIViewRepresentable {
    
    var text: String
    var placeholder: String
    private let delegate = TextFieldDelegate()
    
    func makeUIView(context: UIViewRepresentableContext<MyTextField>) -> UITextField {
        
        let tmpView = UITextField()
        tmpView.text = text
        tmpView.borderStyle = .roundedRect
        tmpView.placeholder = placeholder
        tmpView.delegate = delegate
        return tmpView
    }
    
    func updateUIView(_ uiView: UITextField, context: UIViewRepresentableContext<MyTextField>) {
    }
}

// SwiftUI使用
//struct ContentView : View {
//
//    var body: some View {
//        MyTextField(text: "", placeholder: "请输入内容").frame(height: 40).padding()
//    }
//}
