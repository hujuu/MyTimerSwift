//
//  ContentView.swift
//  MyTimer
//
//  Created by KEN NAKAI on 2023/11/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("タイマー画面")
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        SettingView()
                    } label: {
                        Text("秒数設定")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
