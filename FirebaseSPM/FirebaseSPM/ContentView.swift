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
    @State var id = ""
    @State var category = ""
    @State var time = ""
    
    var body: some View {
        VStack{
            List(model.list){
                item in
                
                HStack{
                    Text(item.time)
                    
                    Spacer()
                    
                    Button(action: {
                        //call add data
                        model.deleteData(lessonToDelete: Lesson(docid: item.docid, id: item.id, category: item.category, time: item.time))
                        
                        //remove text fields
                        
                    }, label: {
                        Text("Delete")
                    })
                }
            }
        }
        
        Divider()
        
        VStack(spacing: 5){
            TextField("ID: ", text: $id)
            TextField("category: ", text: $category)
            TextField("time: ", text: $time)
            
            Button(action: {
                //call add data
                model.addData(id: Int(id) ?? 0, category: category, Time: time)
                
                //remove text fields
                id = ""
                category = ""
                time = ""
                
            }, label: {
                Text("Add Lesson Details")
            })
        }
        .padding()
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
