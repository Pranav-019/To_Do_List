//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by apple on 15/05/24.
//


//view model for list of items in todolist
import FirebaseFirestore
import Foundation
class ToDoListViewViewModel : ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init (userId: String) {
        self.userId = userId
    }
    
    ///  Delete To Do List Item
    /// - Parameter id: item id to delete
    func delete(id: String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
