//
//  ContentView.swift
//  sawn-timber
//
//  Created by Ary Sugiarto on 29/08/25.
//

import SwiftUI

struct ContentView: View {
    private let context = CoreDataManager.shared.container.viewContext
    @State private var showSplash = true
    
    var body: some View {
        ZStack {
            if showSplash {
                SplashScreen()
            } else {
                NavigationView {
                    TabView {
                        CalculatorScreen(
                            vm: CalculatorViewModel(context: context)
                        )
                        .tabItem {
                            Label("Kalkulator", systemImage: "function")
                        }
                        .environment(\.managedObjectContext, context)

                        HistoryScreen(
                            vm: CalculatorViewModel(context: context)
                        )
                        .tabItem {
                            Label("History", systemImage: "clock.arrow.circlepath")
                        }
                        .environment(\.managedObjectContext, context)
                    }
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    showSplash = false
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
