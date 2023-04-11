//
//  CocoaPod1App.swift
//  CocoaPod1
//
//  Created by cashamirica on 4/10/23.
//

import SwiftUI
import Firebase

@main
struct CocoaPod1App: App {
    
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
