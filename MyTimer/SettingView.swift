//
//  SettingView.swift
//  MyTimer
//
//  Created by KEN NAKAI on 2023/11/20.
//

import SwiftUI

struct SettingView: View {
    @AppStorage("timer_value") var timerValue = 10
    var body: some View {
        ZStack {
            Color.backgroundSetting
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("\(timerValue)秒")
                    .font(.largeTitle)
                Spacer()
                Picker(selection: $timerValue) {
                    Text("10")
                        .tag(10)
                    Text("20")
                        .tag(20)
                    Text("10")
                        .tag(10)
                } label: {
                    Text("選択")
                }
                .pickerStyle(.wheel)
                Spacer()
            }
        }
    }
}

#Preview {
    SettingView()
}
