//
//  PersonalProfileStorage.swift
//  VKAPP-Volohin
//
//  Created by Евгений Волохин on 11.07.2021.
//

import Foundation

class PersonalProfileStorage {
    var personalInfo: [PersonalProfileModel]
    
    // да, здесь я использую именно такую структуру хранения статичных данных, потому что это моё первое приложение и я пока не научился создавать динамические базы данных. но скоро — обязательно
    init() {
        personalInfo = [PersonalProfileModel(profileAvatar: "profileImage", profileNameSurname: "Harold Painless",
                                             profileStatus: "Never online",
                                             profileAbout: "Harold hiding his pain, aka Harold or Maurice — is an Internet meme depicting an elderly man whose facial expression can be regarded as pent-up pain. The real name of the person depicted is Andras Arato", profileInterests: "Do nothing",
                                             profileFavImage: "Favourites Harolds pics:")]
    }
}
