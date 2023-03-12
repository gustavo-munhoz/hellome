//
//  InteractionView.swift
//  hellome
//
//  Created by Gustavo Munhoz Correa on 07/03/23.
//

import SwiftUI

struct InteractionView: View {
    var users: [User];
    
    init(users: [User]) {
        self.users = users;
    }
    
    var body: some View {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                    ForEach(users) { user in
                        NavigationLink(destination: ProfileView(user: user)) {
                            VStack {
                                Image(user.avatarFileName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 120, height: 120)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.black, lineWidth: 2)
                                    )
                                    .cornerRadius(10)
                                Text("\(user.name), \(user.age)")
                                    .font(.subheadline)
                                    .bold()
                                    .padding(.bottom, 15)
                            }
                        }
                    }
                }
            }.toolbar(.hidden)
        }
}

struct InteractionView_Previews: PreviewProvider {
    static var previews: some View {
        InteractionView(users: UsersRepo().getUsers());
    }
}
