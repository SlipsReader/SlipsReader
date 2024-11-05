//
//  ProfileView.swift
//  SlipsReader
//
//  Created by ITCharge on 2024/11/1.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            Text("这是我的页面")
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("我的")
                            .font(.headline)
                    }
                }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
