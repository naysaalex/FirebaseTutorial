//
//  ContentView.swift
//  FirebaseSPM
//
//  Created by cashamirica on 4/12/23.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @ObservedObject var model = ViewModels()
    var body: some View {
        List(model.list){
            item in
            
            Text(item.time)
        }
    }
    init(){
        model.getData()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
