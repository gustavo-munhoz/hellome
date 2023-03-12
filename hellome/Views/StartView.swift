//
//  StartView.swift
//  hellome
//
//  Created by Gustavo Munhoz Correa on 08/03/23.
//

import SwiftUI

struct StartView: View {
    @State private var animate = false;
    @State private var shouldBlink = true;
    @State private var hide = false;
    @State private var text: String = "Bom dia";
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Hello, Me!").font(.largeTitle).bold()
                    .scaleEffect(animate ? 1 : 2)
                    .offset(x: 0, y: animate ? -10 : 350)
                    .animation(.easeOut(duration: 1), value: animate)
                
                Image("touchInstruction").resizable().frame(width: 100, height: 100)
                    .isHidden(hide)
                    .offset(x: -10, y: 400)
                    .opacity(shouldBlink ? 1 : 0)
                    .animation(.easeInOut(duration: 2).repeatForever(), value: shouldBlink)
                    .onAppear {
                        let timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
                            if !animate {shouldBlink.toggle()}
                        }
                        timer.fire()
                    }
            
                Image("icon")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .aspectRatio(contentMode: .fill)
                    .opacity(animate ? 1 : 0)
                    .offset(x: 45, y: -70)
                    .animation(.easeIn(duration: 2), value: animate)
                    .rotationEffect(animate ? Angle(degrees: -15) : Angle(degrees: 15), anchor: .bottom)
                    .animation(Animation.easeInOut(duration: 0.3).repeatCount(7), value: animate)
                

                VStack {
                    Spacer()
                    NavigationLink(destination: LoginView()) {
                        Text("FAZER LOGIN").font(.title).bold()
                    }.buttonStyle(WideBlackButton(width: 240, height: 50)).padding(.bottom, 15)

                    NavigationLink(destination: RegistrationView()) {
                        Text("REGISTRAR").font(.title).bold()
                    }.buttonStyle(WideBlackButton(width: 240, height: 50))
                }.opacity(animate ? 1 : 0)
                    .animation(.easeInOut(duration: 2), value: animate)
                
            }.font(.headline)
            .padding()
        }
        .onTapGesture {
            animate = true;
            hide = true;
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
        
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
