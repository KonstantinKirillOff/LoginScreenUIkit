//
//  User.swift
//  LoginScreenUIkit
//
//  Created by Konstantin Kirillov on 04.07.2022.
//

struct Person {
    let name: String
    let lastName: String
    let phone: String
    let photo: String
    let user: User
    
    var fullName: String {
        "\(name) \(lastName)"
    }
    
    static func getMockPerson() -> Person {
        return Person(name: "Konstantin",
                      lastName: "Kirillov",
                      phone: "+7 916 029 9895",
                      photo: "photoKirillov",
                      user: User(login: "kirill_off", password: "123"))
    }
}

struct User {
    let login: String
    let password: String
}
