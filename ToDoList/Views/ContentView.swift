//
//  ContentView.swift
//  ToDoList
//
//  Created by apple on 14/05/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
        } else {
            LogInView()
        }
    }
    @ViewBuilder
   var accountView : some View{
       TabView {
           ToDoListView(userId: viewModel.currentUserId)
               .tabItem {
                   Label("Home", systemImage: "house")
               }
           ProfileView()
               .tabItem {
                   Label("Profile", systemImage: "person.circle")
               }
       }
       .accentColor(.brown) // This changes the selected tab item color to brown
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
