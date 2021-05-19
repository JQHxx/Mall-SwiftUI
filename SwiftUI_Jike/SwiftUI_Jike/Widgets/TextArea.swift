//
//  TextArea.swift
//  SwiftUI_Jike
//
//  Created by OFweek01 on 2021/5/19.
//  Copyright © 2021 alexyang. All rights reserved.
//

import SwiftUI

struct TextArea: View {
    
    @Binding var text: String
    
    let placeholder: String
    
    init(_ placeholder: String, text: Binding<String>) {
        self._text = text
        self.placeholder = placeholder
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color(.placeholderText))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
                
            }
            
            /*
            TextEditor(text: $text)
                .padding(4)
             */
        }.font(.body)
    }
}

struct TextArea_Previews: PreviewProvider {
    static var previews: some View {
        TextArea("What's happening?", text: .constant("dasdsadadasda"))
    }
}
