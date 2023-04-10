//
//  FirebaseTutApp.swift
//  FirebaseTut
//
//  Created by cashamirica on 4/10/23.
//

import SwiftUI
import Firebase

@main
struct FirebaseTutApp: App {
    @StateObject var dataManager = DataManager()
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
//            ListView()
                .environmentObject(dataManager)
        }
    }
}
