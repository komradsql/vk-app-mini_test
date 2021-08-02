//
//  PersonInListModel.swift
//  VKAPP-Volohin
//
//  Created by Евгений Волохин on 09.07.2021.
//

import Foundation

struct PersonInListModel {
    var nameSurname: String
    var avatarName: String
    var isOnline: String
    var mutualFriends: String
    var city: String
    var photosInProfile: [PhotosInProfile]
    var fullProfileInfo: [FullProfileInfo]
}
