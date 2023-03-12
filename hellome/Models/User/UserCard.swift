//
//  UserCard.swift
//  hellome
//
//  Created by Gustavo Munhoz Correa on 07/03/23.
//

class UserCard {
    var userName: String;
    var userAge: Int;
    var mainInterest: String;
    var avatarFileName: String;
    
    init(user: User) {
        self.userName = user.name;
        self.userAge = user.age;
        self.mainInterest = user.interests[0];
        self.avatarFileName = user.avatarFileName;
    }
}
