//
//  CustomSegmentedPicker.swift
//  sawn-timber
//
//  Created by Ary Sugiarto on 29/08/25.
//

import SwiftUI

struct CustomSegmentedPicker: View {
    @Binding var selection: String
    let options: [String]
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(options, id: \.self) { option in
                Text(option)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .background(selection == option ? Color.green : Color.clear)
                    .foregroundColor(selection == option ? Color.white : Color.primary)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(selection == option ? Color.green : Color.gray, lineWidth: 1)
                    )
                    .onTapGesture {
                        self.selection = option
                    }
            }
        }
        .padding(1)
    }
}
