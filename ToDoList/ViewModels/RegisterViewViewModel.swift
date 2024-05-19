//
//  RegisterViewViewModel.swift
//  ToDoList
//
//  Created by apple on 15/05/24.
//
import FirebaseFirestore
import FirebaseAuth
import Foundation
class RegisterViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    
    init () {}
    
    
    //Register A user
    func register () {
        guard validate() else{
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) {result , error in
            guard let userId = result?.user.uid else{
                return
            }
            self.insertuserRecord(id: userId)
            
        }
        
    }
    
    private func insertuserRecord(id: String) {
        let newUser = User(id: id, name: name, email: email, joined: Date.timeIntervalBetween1970AndReferenceDate)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
        
    }
    
    
    //validate a user
    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        //return true
        
        guard email.contains("@") && email.contains(".") else{
            return false
        }
       
        
        guard password.count >= 6 else {
            return false
        }
        return true
    }
    
   

}
