//
//  ContentView.swift
//  StateAndDataFlowApp
//
//  Created by Alexey Efimov on 16.12.2020.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var user: UserManager
    @StateObject private var timer = TimeCounter()
    
    var body: some View {
        VStack {
            Text("Hi, \(user.name)")
                .font(.largeTitle)
                .offset(x: 0, y: 100)
            Text("\(timer.counter)")
                .font(.largeTitle)
                .offset(x: 0, y: 200)
            Spacer()
            ButtonView(timer: timer)
            Spacer()
            ButtonLogOutView(user: user)
        }
    }
}

struct ButtonView: View {
    @StateObject var timer: TimeCounter
    
    var body: some View {
        Button(action: { timer.startTimer() }) {
            Text("\(timer.buttonTitle)")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(Color.red)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 4)
        )
    }
}

struct ButtonLogOutView: View {
    
    let user: UserManager
   
    var body: some View {
        Button(action: {
            user.name = ""
            user.isRegistered = false
            
        }) {
            Text("Log Out")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(Color.blue)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 4)
        )
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}
