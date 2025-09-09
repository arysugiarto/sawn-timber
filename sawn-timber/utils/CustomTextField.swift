//
//  CustomTextField.swift
//  sawn-timber
//
//  Created by Ary Sugiarto on 29/08/25.
//

import SwiftUI

struct CustomTextField: View {
    var placeholder: String
    @Binding var text: String
    var keyboard: UIKeyboardType = .decimalPad
    
    var body: some View {
        TextField(placeholder, text: $text)
            .keyboardType(keyboard)
            .padding(12)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
            )
    }
}
