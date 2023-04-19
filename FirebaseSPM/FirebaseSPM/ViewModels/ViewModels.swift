//
//  ViewModels.swift
//  FirebaseSPM
//
//  Created by cashamirica on 4/12/23.
//

import Foundation
import Firebase

class ViewModels: ObservableObject{
    @Published var list = [Lesson]()
    //write a function to fetch the data from db
    
    func deleteData(lessonToDelete: Lesson){
        //reference the db
        let db = Firestore.firestore()
        
        //specify the doc you want to delete
        db.collection("lesson").document().delete { error in
            if error == nil{
                self.list.removeAll { lesson in
                    return lesson.docid == lessonToDelete.docid
                }
            } else {
                //record the error if you wish
            }
        }
    }
    
    func addData(id: Int, category: String, Time: String){
        //get reference to the database
        let db = Firestore.firestore()
        
        //add a document to the collection
        db.collection("lesson").addDocument(data: ["id":id, "category": category, "time": Time]){
            error in
            if error == nil {
                self.getData()
                
            } else{
                //throw error if you want to record it
            }
        }
    }
    
    func getData(){
        //create database
        let db = Firestore.firestore()
        //reference the db to a specific path
        db.collection("lesson"/*exact name - it's case sensitive*/).getDocuments { snapshot, error in
            //check for errors
            if error == nil{
                //no error
                if let snapshot = snapshot{
                    //snapshot has been returned; just taking snapshot and and assigning it to snapshot again
                    //get all the data from documents
                    DispatchQueue.main.async{
                        self.list = snapshot.documents.map{ d in
                            //snapshot.documents will give a snapshot of documents in database
                            //for loop that is mapping the documents
                            return Lesson(docid: d.documentID, id: d["id"] as? Int ?? 0, category: d["category"] as? String ?? "", time: d["time"] as? String ?? "")
                        }
                    }
                }
            }
            else {
                //error WARNING MESSAGE
            }
            //fails
        }
        //read the document from the db
    }
    //import the data to the UI
    
}
