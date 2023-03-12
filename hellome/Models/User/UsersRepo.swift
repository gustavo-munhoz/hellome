//
//  UsersRepo.swift
//  hellome
//
//  Created by Gustavo Munhoz Correa on 09/03/23.
//

class UsersRepo {
    let user1 = User(id: 1, name: "Gustavo", username: "gustavo_munhoz", password: "minhasenha", age: 22, interests: ["Programação", "Academia", "Jogos", "Mangá"], biography: "Gosto muito de programação, academia, jogos e mangá. Só para deixar claro. Sou professor de disciplinas de exatas, como física, matemática e programação para graduação. Adoro aprender coisas novas, me sinto muito motivado quando consigo fazer algo novo.")
    let user2 = User(id: 2, name: "Ana", username: "ana_silva", password: "senhasecreta", age: 30, interests: ["Viagens", "Gastronomia", "Moda"], biography: "Adoro conhecer novos lugares, experimentar novas comidas e seguir as últimas tendências da moda.")
    
    let user3 = User(id: 3, name: "Pedro", username: "pedro_ferreira", password: "123456", age: 25, interests: ["Esportes", "Música", "Tecnologia"], biography: "Sou um grande fã de esportes, principalmente futebol e basquete. Também gosto de ouvir música e ficar por dentro das últimas novidades em tecnologia.")
    
    let user4 = User(id: 4, name: "Marina", username: "marina_santos", password: "minhasenhasecreta", age: 28, interests: ["Cinema", "Leitura", "Arte"], biography: "Sou apaixonada por cinema, leio muito e adoro visitar museus de arte para apreciar obras incríveis.")
    
    let user5 = User(id: 5, name: "Lucas", username: "lucas_rodrigues", password: "abcd1234", age: 23, interests: ["Fotografia", "Viagens", "Animais"], biography: "Gosto de capturar momentos especiais com minha câmera, adoro viajar e sou um grande amante de animais.")
    
    let user6 = User(id: 6, name: "Julia", username: "julia_pereira", password: "senhasegura", age: 26, interests: ["Culinária", "Yoga", "Natureza"], biography: "Adoro cozinhar, praticar yoga e estar em contato com a natureza.")
    
    let user7 = User(id: 7, name: "Carlos", username: "carlos_nunes", password: "123456789", age: 35, interests: ["Esportes", "Música", "Viagens"], biography: "Gosto de praticar esportes, ouvir música e viajar sempre que possível.")
    
    let user8 = User(id: 8, name: "Luiza", username: "luiza_alves", password: "minhasenhasecreta123", age: 29, interests: ["Cinema", "Leitura", "Arte"], biography: "Sou apaixonada por cinema, leio muito e adoro visitar museus de arte para apreciar obras incríveis.")
    
    let user9 = User(id: 9, name: "João", username: "joao_santos", password: "abcdefgh", age: 20, interests: ["Programação", "Jogos", "Tecnologia"], biography: "Gosto muito de programação, jogos e estar por dentro das últimas novidades em tecnologia.")
    
    let user10 = User(id: 10, name: "Aline", username: "aline_rocha", password: "senhasegura123", age: 27, interests: ["Viagens", "Gastronomia", "Moda"], biography: "Adoro conhecer novos lugares, experimentar novas comidas e seguir as últimas tendências da moda.")
    
    func getUsers() -> [User] {
        return [user1, user2, user3, user4, user5, user6, user7, user8, user9, user10]
    }
}

