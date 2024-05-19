//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by apple on 14/05/24.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    init () {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
            //ProfileView()
        }
    }
}
