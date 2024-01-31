//
//  ContentView.swift
//  CustomTextFieldExample
//
//  Created by cano on 2024/01/31.
//

import SwiftUI

struct ContentView: View {
    @State private var emailID: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
                /// Custom Text Fields
                CustomTextField(sfIcon: "at", hint: "Email ID", value: $emailID)
                
                CustomTextField(sfIcon: "lock", hint: "Password", isPassword: true, value: $password)
                    .padding(.top, 5)
                
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
