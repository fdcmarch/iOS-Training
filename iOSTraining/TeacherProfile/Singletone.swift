//
//  Singletone.swift
//  iOSTraining
//
//  Created by FDC-CrisMarch on 11/8/24.
//

import Foundation

class MySingleton {
    // Shared instance
    static let shared = MySingleton()
    private (set) var isLogin = false
    
    // Private initializer to prevent external initialization
    private init() {
        // Initialization code here, if necessary
    }
    
    // Example of a method or property in the singleton
    func doSomething() {
        print("Singleton method called")
    }
    
    func setValue(for isLogin: Bool){
        self.isLogin = isLogin
    }
}
