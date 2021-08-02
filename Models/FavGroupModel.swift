//
//  FavGroupsModel.swift
//  VKAPP-Volohin
//
//  Created by Евгений Волохин on 12.07.2021.
//

import Foundation

struct FavGroupModel {
    var title: String
    var imageOfGroup: String
    var description: String
    var numbersOfParticipant: String
    var participant: [AllPeopleInGroupModel]
}
