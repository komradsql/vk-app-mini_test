//
//  PersonalPhotosStorage.swift
//  VKAPP-Volohin
//
//  Created by Евгений Волохин on 20.07.2021.
//

import Foundation

class PersonalPhotosStorage {
    var personalPhotos: [FavPhotosInProfileModel]
    
    init() {
        personalPhotos = [FavPhotosInProfileModel(firstPhoto: "haroldFirstFavPhoto", secondPhoto: "haroldSecondFavPhoto", thirdPhoto: "haroldThirdFavPhoto")]
    }
}
