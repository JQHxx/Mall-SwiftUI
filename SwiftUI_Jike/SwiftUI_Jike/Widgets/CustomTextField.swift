//
//  CustomTextField.swift
//  SwiftUI_Jike
//
//  Created by OFweek01 on 2021/5/19.
//  Copyright © 2021 alexyang. All rights reserved.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    
    let placeholder: String
    
    let image: String
    
    let isSecure: Bool
    
    let keyboardType: UIKeyboardType
    
    var body: some View {
        
        HStack(spacing: 16) {
            Image(systemName: image)
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
                .frame(width: 20, height: 20)
            ZStack {
                if text.isEmpty {
                    Text(placeholder)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color(.init(white: 1.0, alpha: 0.87)))
                }
                if isSecure{
                    SecureField("", text: $text)
                        .foregroundColor(.white)
                }else{
                    TextField("", text: $text)
                        .foregroundColor(.white)
                        .keyboardType(keyboardType)
                }
                
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(#colorLiteral(red: 0.3105490208, green: 0.6851375699, blue: 0.9646214843, alpha: 1)))
        .cornerRadius(10)
        
        
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.blue
            CustomTextField(text: .constant(""), placeholder: "Email", image: "envelope", isSecure: false, keyboardType: .emailAddress)
        }
    }
}
