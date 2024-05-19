//
//  User.swift
//  ToDoList
//
//  Created by apple on 15/05/24.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
