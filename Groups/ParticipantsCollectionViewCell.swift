//
//  ParticipantsCollectionViewController.swift
//  VKAPP-Volohin
//
//  Created by Евгений Волохин on 13.07.2021.
//

import UIKit

final class ParticipantsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ParticipantsCollectionViewCell"
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var desciptionLabel: UILabel!
    @IBOutlet weak var mututalFriends: UILabel!
    
    func configure(participant: AllPeopleInGroupModel) {
        avatarImage.image = UIImage(named: participant.imageOfParti)
        nameLabel.text = participant.nameSurname
        desciptionLabel.text = participant.description
        mututalFriends.text = "Mutual friends: \(participant.mututalFriends)"
    }
}
