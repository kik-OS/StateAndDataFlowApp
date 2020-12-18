//
//  StateAndDataFlowAppApp.swift
//  StateAndDataFlowApp
//
//  Created by Alexey Efimov on 16.12.2020.
//

import SwiftUI

@main
struct StateAndDataFlowAppApp: App {
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(UserManager())
        }
    }
}
