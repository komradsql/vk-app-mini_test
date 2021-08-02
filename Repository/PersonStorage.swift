//
//  PersonStorage.swift
//  VKAPP-Volohin
//
//  Created by Евгений Волохин on 09.07.2021.
//

import Foundation

class PersonStorage {
    var persons: [PersonInListModel]
    let allPersons: [PersonInListModel]
    
    // да, здесь я использую именно такую структуру хранения статичных данных, потому что это моё первое приложение и я пока не научился создавать динамические базы данных. но скоро — обязательно
    init() {
        persons = [PersonInListModel(nameSurname: "John Dow", avatarName: "John", isOnline: "Online", mutualFriends: "9", city: "London",  photosInProfile: [PhotosInProfile(mainPhoto: "Griezmann", date: "25.02.1989")],
                                     fullProfileInfo: [FullProfileInfo(profileNameSurname: "John Dow", profileAvatar: "John", profileStatus: "Online", profileDescription: "Stark. Tony Stark. Just я устал писать на английском", profileMutualFriends: "9")]
                                     )]
        
        allPersons = [
            PersonInListModel(nameSurname: "Alice Norman", avatarName: "Alice", isOnline: "Offline", mutualFriends: "2", city: "Paris",
                              photosInProfile: [PhotosInProfile(mainPhoto: "Dybala", date: "09.04.2021"),
                                                PhotosInProfile(mainPhoto: "Ronaldo", date: "09.04.2021"),
                                                PhotosInProfile(mainPhoto: "Mbappe", date: "09.04.2021")], fullProfileInfo: [FullProfileInfo(profileNameSurname: "Alice Norman", profileAvatar: "Alice", profileStatus: "Offline", profileDescription: "Natasha Romanoff. The film Black Widow was not great, not terrible", profileMutualFriends: "2")]),
            PersonInListModel(nameSurname: "Barak Omaba", avatarName: "Barak", isOnline: "Online", mutualFriends: "2", city: "Washington",
                              photosInProfile: [PhotosInProfile(mainPhoto: "Mbappe", date: "09.09.2021"),
                                                PhotosInProfile(mainPhoto: "Ronaldo", date: "09.04.2021"),
                                                PhotosInProfile(mainPhoto: "Dybala", date: "09.04.2021"),
                                                PhotosInProfile(mainPhoto: "Griezmann", date: "09.04.2021")], fullProfileInfo: [FullProfileInfo(profileNameSurname: "Barak Omaba", profileAvatar: "Barak", profileStatus: "Online", profileDescription: "Ex-president of USA. Was good person.", profileMutualFriends: "2")]),
            PersonInListModel(nameSurname: "Sky Cooker", avatarName: "Cooker", isOnline: "Offline", mutualFriends: "0", city: "Moscow",
                              photosInProfile: [PhotosInProfile(mainPhoto: "Dybala", date: "09.04.2021"),
                                                PhotosInProfile(mainPhoto: "Ronaldo", date: "09.04.2021"),
                                                PhotosInProfile(mainPhoto: "Dybala", date: "09.04.2021"),
                                                PhotosInProfile(mainPhoto: "Griezmann", date: "09.04.2021"),
                                                PhotosInProfile(mainPhoto: "Dybala", date: "09.04.2021")], fullProfileInfo: [FullProfileInfo(profileNameSurname: "Sky Cooker", profileAvatar: "Cooker", profileStatus: "Offline", profileDescription: "Hulk. Bit green monster.", profileMutualFriends: "0")]),
            PersonInListModel(nameSurname: "Velmir", avatarName: "Velmir", isOnline: "Offline", mutualFriends: "83", city: "Rome",
                              photosInProfile: [PhotosInProfile(mainPhoto: "Ronaldo", date: "09.04.2021"),
                                                PhotosInProfile(mainPhoto: "Griezmann", date: "09.04.2021"),
                                                PhotosInProfile(mainPhoto: "Dybala", date: "09.04.2021"),
                                                PhotosInProfile(mainPhoto: "Griezmann", date: "09.04.2021")], fullProfileInfo: [FullProfileInfo(profileNameSurname: "Velmir", profileAvatar: "Velmir", profileStatus: "Offline", profileDescription: "Capitan America. Will be frozen", profileMutualFriends: "83")]),
            PersonInListModel(nameSurname: "July Ceacer", avatarName: "Ceacer", isOnline: "Online", mutualFriends: "44", city: "Anzio",
                             photosInProfile: [PhotosInProfile(mainPhoto: "Mbappe", date: "09.04.2021"),
                                               PhotosInProfile(mainPhoto: "Ronaldo", date: "09.04.2021"),
                                               PhotosInProfile(mainPhoto: "Dybala", date: "09.04.2021"),
                                               PhotosInProfile(mainPhoto: "Griezmann", date: "09.04.2021")], fullProfileInfo: [FullProfileInfo(profileNameSurname: "July Ceacer", profileAvatar: "Ceacer", profileStatus: "Online", profileDescription: "Just text for description", profileMutualFriends: "44")]),
            PersonInListModel(nameSurname: "Paulo Dybala", avatarName: "Dybala", isOnline: "Online", mutualFriends: "3", city: "Torino",
                              photosInProfile: [PhotosInProfile(mainPhoto: "Mbappe", date: "09.04.2021"),
                                                PhotosInProfile(mainPhoto: "Ronaldo", date: "09.04.2021"),
                                                PhotosInProfile(mainPhoto: "Mbappe", date: "09.04.2021"),
                                                PhotosInProfile(mainPhoto: "Dybala", date: "09.04.2021"),], fullProfileInfo: [FullProfileInfo(profileNameSurname: "Paulo Dybala", profileAvatar: "Dybala", profileStatus: "Online", profileDescription: "The player of Juventus. Will score 30+9 in next season", profileMutualFriends: "3")]),]
    }
}
