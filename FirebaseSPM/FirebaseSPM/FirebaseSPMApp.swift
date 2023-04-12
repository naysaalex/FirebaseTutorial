//
//  FirebaseSPMApp.swift
//  FirebaseSPM
//
//  Created by cashamirica on 4/12/23.
//

import SwiftUI
import Firebase

@main
struct FirebaseSPMApp: App {
    
    //init
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
