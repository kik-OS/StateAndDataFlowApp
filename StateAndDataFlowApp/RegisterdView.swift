//
//  RegisterdView.swift
//  StateAndDataFlowApp
//
//  Created by Alexey Efimov on 16.12.2020.
//

import SwiftUI

struct RegisterdView: View {
    @State private var name = ""
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        VStack {
            HStack{
                Spacer(minLength: 40)
            TextField("Enter your name", text: $name)
                .multilineTextAlignment(.center)
                .padding()
                Text("\(name.count)")
                    .padding()
                    .foregroundColor(name.count < 3 ? .red : .green)
            }
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Ok")
                }
            }.disabled(name.count < 3)
        }
    }
    
    private func registerUser() {
        if !name.isEmpty {
            user.name = name
            user.isRegistered = true
        }
    }
}

struct RegisterdView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterdView()
    }
}
