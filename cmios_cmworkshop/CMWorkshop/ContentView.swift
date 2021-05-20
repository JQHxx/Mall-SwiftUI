//
//  ContentView.swift
//  CMWorkshop
//
//  Created by Codemobiles Golf on 20/7/2563 BE.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            MenuView()
                .navigationBarTitle("Codemobiles Workshop", displayMode: .inline)
            if UIDevice.current.userInterfaceIdiom == .pad {
                PageThreeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
