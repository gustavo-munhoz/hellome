//
//  ContentView.swift
//  hellome
//
//  Created by Gustavo Munhoz Correa on 06/03/23.
//

import SwiftUI

struct RegistrationView: View {
    @State private var name: String = "";
    @State private var age: Int = 0;
    @State private var interests: [String] = [];
    @State var newInterest: String = "";
    @State private var users: [User] = [];
    @State private var isRegistered = false;
    @State private var shouldNavigate = false;
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Users registered: \(users.count)")
                TextField("Name: ", text: $name);
                Stepper("Age: \(age)", value: $age);
                HStack {
                    TextField("Interests ", text: $newInterest);
                    Button(action: addInterest) {
                        Text("Add");
                    }
                }
                HStack{
                    ForEach(interests, id: \.self) {interest in Text(interest)
                            .background(Color.cyan.opacity(0.3))
                            .padding(5)
                    }
                }
                Button("Register!") {
                    if (name != "" && age > 0 && interests.count >= 3) {
                        users.append(User(name: name, age: age, interests: interests));
                        name = "";
                        age = 0;
                        interests = [];
                        isRegistered = true;
                        shouldNavigate = true;
                    }
                }
            }
            .padding()
        }.navigationDestination(isPresented: $shouldNavigate) {
            WelcomeView();
        }
    }
    
    func addInterest() {
        if (!newInterest.isEmpty){ interests.append(newInterest); }
        newInterest = "";
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
