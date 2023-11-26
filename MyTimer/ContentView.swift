//
//  ContentView.swift
//  MyTimer
//
//  Created by KEN NAKAI on 2023/11/20.
//

import SwiftUI

struct ContentView: View {
    @State var timerHandler: Timer?
    @State var count = 0
    @AppStorage("timer_value") var timerValue = 10
    var body: some View {
        NavigationStack {
            ZStack {
                Image(.backgroundTimer)
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
                VStack(spacing: 30.0) {
                    Text("残り\(timerValue - count)秒")
                        .font(.largeTitle)
                    HStack {
                        Button {
                            startTimer()
                        } label: {
                            Text("スタート")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .foregroundStyle(Color.white)
                                .frame(width: 140, height: 140)
                                .background(Color.start)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        }
                        Button {
                            if let timerHandler {
                                if timerHandler.isValid == true {
                                    timerHandler.invalidate()
                                }
                            }
                        } label: {
                            Text("ストップ")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .foregroundStyle(Color.white)
                                .frame(width: 140, height: 140)
                                .background(Color.stop)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        }
                    }
                }
            }
            .onAppear {
                count = 0
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
    func counDownTimer() {
        count += 1
        
        if timerValue - count <= 0 {
            timerHandler?.invalidate()
        }
    }
    func startTimer() {
        if let timerHandler {
            if timerHandler.isValid == true {
                return
            }
        }
        if timerValue - count <= 0 {
            count = 0
        }
        timerHandler = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in counDownTimer()}
    }
}

#Preview {
    ContentView()
}
