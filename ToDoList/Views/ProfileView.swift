//
//  ProfileView.swift
//  ToDoList
//
//  Created by apple on 15/05/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            if let user = viewModel.user {
                VStack {
                    // Avatar
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.brown)
                        .frame(width: 125, height: 125)
                        .padding()
                    
                    // Info
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Name: ")
                                .bold()
                                .padding()
                            Text(user.name)
                        }
                        HStack {
                            Text("Email: ")
                                .bold()
                                .padding()
                            Text(user.email)
                        }
                        HStack {
                            Text("Member Since")
                                .bold()
                                .padding()
                            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                        }
                    }
                    
                    // Signout
                    Button("Log Out") {
                        viewModel.logOut()
                    }
                    .tint(.brown)
                    .padding()
                    Spacer()
                }
                .navigationTitle("Profile")
            } else {
                Text("Loading Profile....")
                    .navigationTitle("Profile")
            }
                
        
        }
        .onAppear{
            viewModel.fetchUser()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
