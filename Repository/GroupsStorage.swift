//
//  GroupsStorage.swift
//  VKAPP-Volohin
//
//  Created by Евгений Волохин on 12.07.2021.
//

import Foundation

class GroupsStorage {
    let group: [FavGroupModel]
    let allGroups: [FavGroupModel]
    
    // да, здесь я использую именно такую структуру хранения статичных данных, потому что это моё первое приложение и я пока не научился создавать динамические базы данных. но скоро — обязательно. но сейчас — страдаем.
    init() {
        group = [FavGroupModel(title: "Juventus", imageOfGroup: "Juventus", description: "Juventus is a professional football club based in Turin.", numbersOfParticipant: "214194", participant:
                                [AllPeopleInGroupModel(nameSurname: "Cristiano Ronaldo", imageOfParti: "Ronaldo", description: "Is a Portuguese professional footballer", mututalFriends: "42"),
                                 AllPeopleInGroupModel(nameSurname: "Jurgen Klopp", imageOfParti: "Klopp", description: "Is a Portuguese professional footballer", mututalFriends: "42"),
                                 AllPeopleInGroupModel(nameSurname: "Mohhamed Salah", imageOfParti: "Salah", description: "Is a Portuguese professional footballer", mututalFriends: "42"),
                                 AllPeopleInGroupModel(nameSurname: "Mane", imageOfParti: "Mane", description: "Is a Portuguese professional footballer", mututalFriends: "42")])]
        
        allGroups = [FavGroupModel(title: "Liverpool", imageOfGroup: "Liverpool", description: "Liverpool Football Club is a professional football club.", numbersOfParticipant: "88123", participant:
                                    [AllPeopleInGroupModel(nameSurname: "Jurgen Klopp", imageOfParti: "Klopp", description: "Trainer", mututalFriends: "99"),
                                     AllPeopleInGroupModel(nameSurname: "Mohhamed Salah", imageOfParti: "Salah", description: "Player. Good Player", mututalFriends: "3"),
                                     AllPeopleInGroupModel(nameSurname: "Mane", imageOfParti: "Mane", description: "Player. Fast, very fast", mututalFriends: "0")]),
                     FavGroupModel(title: "Swift Developers", imageOfGroup: "SwiftLogo", description: "Let's just see at an exapmle of group", numbersOfParticipant: "9999999", participant:
                                    [AllPeopleInGroupModel(nameSurname: "Mohhamed Salah", imageOfParti: "Salah", description: "I'm just trying to code", mututalFriends: "0"),
                                     AllPeopleInGroupModel(nameSurname: "Mane", imageOfParti: "Mane", description: "I'm just trying to code", mututalFriends: "0"),
                                     AllPeopleInGroupModel(nameSurname: "Mohhamed Salah", imageOfParti: "Salah", description: "I'm just trying to code", mututalFriends: "0"),
                                     AllPeopleInGroupModel(nameSurname: "I am", imageOfParti: "JustMe", description: "I'm just trying to code", mututalFriends: "0")]),
                     FavGroupModel(title: "Liverpool", imageOfGroup: "Liverpool", description: "Liverpool Football Club is a professional football club.", numbersOfParticipant: "6219821", participant:
                                    [AllPeopleInGroupModel(nameSurname: "Jurgen Klopp", imageOfParti: "Klopp", description: "Trainer", mututalFriends: "21"),
                                     AllPeopleInGroupModel(nameSurname: "Ronaldo", imageOfParti: "Ronaldo", description: "Player", mututalFriends: "999"),
                                     AllPeopleInGroupModel(nameSurname: "Griezmann", imageOfParti: "Griezmann", description: "A good and an underastimated player. Hope he wiil leave Barca this year.", mututalFriends: "12"),
                                     AllPeopleInGroupModel(nameSurname: "Ronaldo", imageOfParti: "Ronaldo", description: "Player", mututalFriends: "37"),
                                     AllPeopleInGroupModel(nameSurname: "Griezmann", imageOfParti: "Griezmann", description: "A good and an underastimated player. Hope he wiil leave Barca this year.", mututalFriends: "1928"),
                                     AllPeopleInGroupModel(nameSurname: "Ronaldo", imageOfParti: "Ronaldo", description: "Player", mututalFriends: "23")]),
                     FavGroupModel(title: "TJ", imageOfGroup: "TJ", description: "Новости про интернет: тренды, скандалы, технологии и медиа.", numbersOfParticipant: "1982731891", participant:
                                    [AllPeopleInGroupModel(nameSurname: "Mbappe", imageOfParti: "Mbappe", description: "Better playing in EPL", mututalFriends: "none"),
                                     AllPeopleInGroupModel(nameSurname: "Mbappe", imageOfParti: "Mbappe", description: "Better playing in EPL", mututalFriends: "none"),
                                     AllPeopleInGroupModel(nameSurname: "Mbappe", imageOfParti: "Mbappe", description: "Better playing in EPL", mututalFriends: "none"),
                                     AllPeopleInGroupModel(nameSurname: "Mbappe", imageOfParti: "Mbappe", description: "Better playing in EPL", mututalFriends: "none"),
                                     AllPeopleInGroupModel(nameSurname: "Mbappe", imageOfParti: "Mbappe", description: "Better playing in EPL", mututalFriends: "none")]),
                     FavGroupModel(title: "Habr", imageOfGroup: "Habr", description: "Среди читателей Хабра, вероятно, нет людей, которые никогда не видели водомерок. Это очень распространенное семейство насекомых, которое включает около 1700 видов. Большинство — пресноводные, но есть и виды, которые живут на побережье морей и океанов.", numbersOfParticipant: "1488888", participant:
                                    [AllPeopleInGroupModel(nameSurname: "Mohhamed Salah", imageOfParti: "Salah", description: "Египетский футболист, нападающий английского клуба «Ливерпуль» и национальной сборной Египта. Считается одним из лучших игроков в мире. Двукратный обладатель «Золотой бутсы» английской Премьер-лиги.", mututalFriends: "245"),
                                     AllPeopleInGroupModel(nameSurname: "Mohhamed Salah", imageOfParti: "Salah", description: "Египетский футболист, нападающий английского клуба «Ливерпуль» и национальной сборной Египта. Считается одним из лучших игроков в мире. Двукратный обладатель «Золотой бутсы» английской Премьер-лиги.", mututalFriends: "12245"),
                                     AllPeopleInGroupModel(nameSurname: "Mohhamed Salah", imageOfParti: "Salah", description: "Египетский футболист, нападающий английского клуба «Ливерпуль» и национальной сборной Египта. Считается одним из лучших игроков в мире. Двукратный обладатель «Золотой бутсы» английской Премьер-лиги.", mututalFriends: "888"),
                                     AllPeopleInGroupModel(nameSurname: "Mohhamed Salah", imageOfParti: "Salah", description: "Египетский футболист, нападающий английского клуба «Ливерпуль» и национальной сборной Египта. Считается одним из лучших игроков в мире. Двукратный обладатель «Золотой бутсы» английской Премьер-лиги.", mututalFriends: "444"),
                                     AllPeopleInGroupModel(nameSurname: "Mohhamed Salah", imageOfParti: "Salah", description: "Египетский футболист, нападающий английского клуба «Ливерпуль» и национальной сборной Египта. Считается одним из лучших игроков в мире. Двукратный обладатель «Золотой бутсы» английской Премьер-лиги.", mututalFriends: "222"),
                                     AllPeopleInGroupModel(nameSurname: "Mohhamed Salah", imageOfParti: "Salah", description: "Египетский футболист, нападающий английского клуба «Ливерпуль» и национальной сборной Египта. Считается одним из лучших игроков в мире. Двукратный обладатель «Золотой бутсы» английской Премьер-лиги.", mututalFriends: "333")])
        ]
    }
}
