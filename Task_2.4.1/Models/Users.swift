//
//  Users.swift
//  Task_2.4.1
//
//  Created by Никита Бат on 29.10.2021.
//

import Foundation

struct Users {
    
    let userName: String
    let password: String
    let firstName: String
    let lastName: String
    var motto: String
    
}

extension Users {
    
    static func creatUser() -> Users {
        return Users(userName: "User",
                     password: "Password",
                     firstName: "Lazy",
                     lastName: "Panda",
                     motto: "Eat! Sleep! Repeat!")
    }
}
