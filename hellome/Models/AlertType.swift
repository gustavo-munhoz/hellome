//
//  AlertType.swift
//  hellome
//
//  Created by Gustavo Munhoz Correa on 09/03/23.
//
import SwiftUI


enum AlertType: Identifiable {
    case dataMissing, usernameTaken, loginFailed
    var id: AlertType {
           return self
    }

    var alert: Alert {
        switch self {
        case .dataMissing:
            return Alert(title: Text("Dados inválidos!"),
                        message: Text("Há dados faltando, tente novamente."),
                        dismissButton: .default(Text("OK")))
        case .usernameTaken:
            return Alert(title: Text("Usuário já existe!"),
                        message: Text("Esse nome de usuário já foi utilizado, por favor, escolha outro."),
                        dismissButton: .default(Text("OK")))
            
        case .loginFailed:
            return Alert(title: Text("Dados inválidos!"),
                         message: Text("Usuário ou senha incorretos, tente novamente."),
                         dismissButton: .default(Text("OK")))
       }
   }
}
