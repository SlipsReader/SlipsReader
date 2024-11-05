//
//  ToolsView.swift
//  SlipsReader
//
//  Created by ITCharge on 2024/11/1.
//

import SwiftUI

struct ToolsView: View {
    var body: some View {
        NavigationView {
            Text("这是工具页面")
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("工具")
                            .font(.headline)
                    }
                }
        }
    }
}

struct ToolsView_Previews: PreviewProvider {
    static var previews: some View {
        ToolsView()
    }
}
