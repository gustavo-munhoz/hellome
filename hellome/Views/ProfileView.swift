//
//  ProfileView.swift
//  hellome
//
//  Created by Gustavo Munhoz Correa on 07/03/23.
//

import SwiftUI

struct ProfileView: View {
    var user: User;
    
    init(user: User) {
        self.user = user;
    }
    
    @State var message: String = "";
    
    var body: some View {
        VStack {
            HStack {
                
                Text("\nHello, \n\(user.name)")
                    .font(.largeTitle).bold()
                    .padding(15)
                Spacer().frame(width: 25)
                ZStack{
                    Circle()
                        .stroke(lineWidth: 4)
                        .frame(width: 150, height: 150)
                    
                    Image(user.avatarFileName)
                        .resizable()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .aspectRatio(contentMode: .fit)
                }
                
            }
            Spacer().frame(height: 25)
            Divider()
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 8) {
                ForEach(user.interests, id: \.self) { interest in
                    Text(interest)
                }
            }
            .padding(.top, 10)
            .padding(.bottom, 10)
            Divider()
            Spacer().frame(height: 15)
            HStack {Text("Biografia").font(.title).padding(.horizontal, 15); Spacer()}.padding(.bottom, 8)
            Text(user.biography).padding(.horizontal, 15)
            Spacer()
            Divider()
        }        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        let user = User(id: 1, name: "Gustavo", username: "gustavo_munhoz", password: "minhasenha", age: 22, interests: ["Programação", "Academia", "Jogos", "Mangá"], biography: "Gosto muito de programação, academia, jogos e mangá. Só para deixar claro.")
        ProfileView(user: user);
    }
}
