//
//  HomeScreen.swift
//  sawn-timber
//
//  Created by Ary Sugiarto on 29/08/25.
//

import SwiftUI
import SwiftUI

struct HomeScreen: View {
    @Environment(\.managedObjectContext) private var context
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Wood Converter")
                .font(.largeTitle.bold())
                .padding(.top, 40)
            
            Text("Hitung volume log dan konversi menjadi kayu gergaji")
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .padding(.horizontal)
            
            NavigationLink(destination: CalculatorScreen(
                vm: CalculatorViewModel(context: context)
            )) {
                Text("Mulai Perhitungan")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .tint(.blue)
            .padding(.horizontal)
            
            Spacer()
        }
    }
}

