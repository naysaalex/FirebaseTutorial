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
