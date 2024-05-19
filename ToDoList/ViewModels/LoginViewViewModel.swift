//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by apple on 15/05/24.
//

import FirebaseAuth
import Foundation
class LoginViewViewModel: ObservableObject{
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init () {}
    
    func login(){
        guard validate() else{
            return
        }
        //try to log the user in
        Auth.auth().signIn(withEmail: email, password: password)
        
        }
        
    
   private func validate() -> Bool{
       errorMessage = ""
       guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
               !password.trimmingCharacters(in: .whitespaces).isEmpty else{
           
           errorMessage = "Please Fill in all the fields"
           return false
   }
       
       //email validation
       guard email.contains("@") && email.contains(".") else{
           errorMessage = "Please Enter Valid Email"
           return false
       }
       return true
       
        }
       
    }



