//
//  ContentView.swift
//  hellome
//
//  Created by Gustavo Munhoz Correa on 06/03/23.
//

import SwiftUI

struct RegistrationView: View {
    @State private var name: String = "";
    @State private var username: String = "";
    @State private var password: String = "";
    @State private var ageString: String = "";
    @State private var age: Int = 0;
    @State private var interests: [String] = [];
    @State private var biography: String = "";
    @State var newInterest: String = "";
    @State private var users: [User] = UsersRepo().getUsers();
    
    @State private var isRegistered = false;
    @State private var shouldNavigate = false;
    @State var alertType: AlertType?;
        
    @State private var selectedImage = UIImage();
    @State private var showImage = false;
    
    var body: some View {
            VStack {
                VStack {
                    HStack {
                        Text("Hello,");
                        TextField("your name here!", text: $name);
                    }.font(.largeTitle).bold()
                    Spacer().frame(height: 15)
                    
                    TextField("Username", text: $username).textInputAutocapitalization(.never)
                    SecureField("Password", text: $password)
                }
                TextField("Age", text: $ageString).keyboardType(.numberPad)
                
                Spacer().frame(height: 10)
                HStack {
                    TextField("Interests (min. 3) ", text: $newInterest);
                    Button(action: addInterest) {
                        Text("ADD").padding(.horizontal, 10);
                    }.buttonStyle(WideBlackButton(width: 88, height: 0)).bold()
                }
                HStack{
                    ForEach(interests, id: \.self) {interest in
                        Text(interest)
                            .overlay(RoundedRectangle(cornerRadius: 10).opacity(0.3).padding(-5))
                            .padding(10)
                    }
                }
                Spacer().frame(height: 20)
                
                VStack {
                    Image(uiImage: self.selectedImage)
                        .resizable()
                        .cornerRadius(50)
                        .padding(.all, 4)
                        .frame(width: 100, height: 100)
                        .background(Color.black.opacity(0.2))
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .padding(8)
                    Button(action: {}, label: {
                        Text("ESCOLHER FOTO")
                            .bold()
                            .onTapGesture {
                                showImage = true;
                            }
                    }).buttonStyle(WideBlackButton(width: 170, height: 0))
                }.sheet(isPresented: $showImage) {
                    ImagePicker(sourceType: .photoLibrary, selectedImage: self.$selectedImage)
                }
                
                VStack {
                    Form {
                        Section(header: Text("Write a simple biography.").bold()) {
                            TextEditor(text: $biography)
                        }
                    }
                    .border(.cyan)
                    .scrollContentBackground(.hidden)
                }
                Button("REGISTER") {
                    age = Int(ageString) ?? 0;
                    if (name.isEmpty || age <= 0 || interests.count < 3
                        || biography.isEmpty || username.isEmpty || password.isEmpty) {
                        alertType = .dataMissing;
                    }
                    
                    else if (!users.filter {$0.username.uppercased() == username.uppercased()}.isEmpty && !username.isEmpty) {
                        alertType = .usernameTaken;
                    }
                    else {
                        users.append(User(
                            id: users.count + 1,
                            name: name,
                            username: username,
                            password: password,
                            age: age,
                            interests: interests,
                            biography: biography));
                        name = "";
                        age = 0;
                        interests = [];
                        isRegistered = true;
                    }
                }.buttonStyle(WideBlackButton(width: 180, height: 35)).bold()

            }
            .padding()
            .navigationDestination(isPresented: $isRegistered) {
                InteractionView(users: users);
            }
            .alert(item: $alertType) { alert in
                alert.alert
            }
        }
    
    func addInterest() {
        if (!newInterest.isEmpty){ interests.append(newInterest); }
        newInterest = "";
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
