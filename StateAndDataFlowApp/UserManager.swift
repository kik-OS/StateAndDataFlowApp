//
//  UserManager.swift
//  StateAndDataFlowApp
//
//  Created by Alexey Efimov on 17.12.2020.
//


import Foundation
import Combine

class UserManager: ObservableObject {
    @Published var isRegistered: Bool {
        didSet {
            UserDefaults.standard.set(isRegistered, forKey: "isRegistered")
        }
    }
    
    @Published var name: String {
        didSet {
            UserDefaults.standard.set(name, forKey: "name")
        }
    }
    
    init() {
        self.isRegistered = UserDefaults.standard.object(forKey: "isRegistered") as? Bool ?? false
        self.name = UserDefaults.standard.object(forKey: "name") as? String ?? ""
    }
    
    
}

