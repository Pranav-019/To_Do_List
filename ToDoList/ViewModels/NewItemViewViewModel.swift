//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by apple on 15/05/24.
//

//view model for list of items in todolist

import FirebaseAuth
import FirebaseFirestore
import Foundation
class NewItemViewViewModel : ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    
    
    init () {}
    
    func save() {
        guard canSave else{
            return
        }

        // get current userId
        guard let uId = Auth.auth().currentUser?.uid else{
            return
        }
        
        
        //create model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(
            id: newId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false
        )
        
        
        //save model to database
        let db = Firestore.firestore()
         db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
    }
    
    var canSave: Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else{
            return false
        }
        return true
    }
    
}
