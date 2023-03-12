//
//  User.swift
//  hellome
//
//  Created by Gustavo Munhoz Correa on 06/03/23.
//

import Foundation

class User: Identifiable {
    var id: Int;
    var name: String;
    var username: String;
    var password: String;
    var age: Int;
    var interests: [String];
    var biography: String;
    var inbox: [String];
    var avatarFileName: String;
        
    init(id: Int, name: String, username: String, password: String, age: Int, interests: [String], biography: String) {
        self.id = id;
        self.name = name;
        self.username = username;
        self.password = password;
        self.age = age;
        self.interests = interests;
        self.biography = biography;
        self.inbox = [];
        self.avatarFileName = "user_avatar_\(id)";
    }
}
