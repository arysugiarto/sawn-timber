//
//  SplashScreen.swift
//  sawn-timber
//
//  Created by Ary Sugiarto on 01/09/25.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @State private var scale: CGFloat = 0.6
    
    private let context = CoreDataManager.shared.container.viewContext
    
    var body: some View {
        if isActive {
            // 👉 Ganti dengan halaman utama kamu, misalnya HistoryScreen
            CalculatorScreen(
                vm: CalculatorViewModel(context: context)
            )
        } else {
            VStack {
                Image(systemName: "leaf.fill") // 👉 ganti dengan logo app kamu
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.green)
                    .scaleEffect(scale)
                    .onAppear {
                        withAnimation(.easeIn(duration: 0.8)) {
                            self.scale = 1.0
                        }
                    }
                
                Text("Sawn Timber")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                    .padding(.top, 16)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white) // bisa diganti gradient atau color lain
            .ignoresSafeArea()
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}


