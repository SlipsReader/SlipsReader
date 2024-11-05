//
//  ContentView.swift
//  SlipsReader
//
//  Created by ITCharge on 2024/7/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {  
            BooksView()
                .tabItem {
                    Image(systemName: "books.vertical.fill")
                    Text("书架")
                }
            
            ToolsView()
                .tabItem {
                    Image(systemName: "wrench.and.screwdriver.fill")
                    Text("工具")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("我的")
                }
        }
        .padding()
        .ignoresSafeArea(.keyboard)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
