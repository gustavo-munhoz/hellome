//
//  LoginView.swift
//  hellome
//
//  Created by Gustavo Munhoz Correa on 08/03/23.
//

import SwiftUI

struct LoginView: View {
    @State private var users: [User] = UsersRepo().getUsers();
    @State private var username: String = "";
    @State private var password: String = "";
    
    @State private var isFinished = false;
    @State var alertType: AlertType?;

    var body: some View {
        VStack {
            Text("Hello, Me").offset(x: 0, y: -10).font(.largeTitle).bold()
            Text("Insert your information below.")
            
            Spacer().frame(height: 50)
            
            TextField("Username", text: $username).textInputAutocapitalization(.never)
            Spacer().frame(height: 20)
            SecureField("Password", text: $password, prompt: Text("Password"))
            Spacer().frame(height: 50)
            Button("LOGIN") {
                let userArray = users.filter {$0.username.uppercased() == username.uppercased()}
                
                if (username.isEmpty || password.isEmpty) {
                    alertType = .dataMissing;
                }
                else if (userArray.isEmpty) {
                    alertType = .loginFailed
                }
                else if (userArray[0].username == username
                         && userArray[0].password != password) {
                    alertType = .loginFailed
                }
                else { isFinished = true }
                
            }.buttonStyle(WideBlackButton(width: 180, height: 35)).font(.title).bold()
            
            Spacer();
        }.padding()
        .navigationDestination(isPresented: $isFinished) {
            InteractionView(users: users);
        }.alert(item: $alertType) { alert in
            alert.alert
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView();
    }
}
