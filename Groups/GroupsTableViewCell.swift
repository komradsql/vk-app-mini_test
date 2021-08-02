//
//  GroupsTableViewCell.swift
//  VKAPP-Volohin
//
//  Created by Евгений Волохин on 13.07.2021.
//

import UIKit

final class GroupsTableViewCell: UITableViewCell {
    
    static let reusedIdentifier = "GroupsTableViewCell"
    
    @IBOutlet weak var groupImageView: UIImageView!
    @IBOutlet weak var titleGroupLable: UILabel!
    @IBOutlet weak var descriptionLable: UILabel!
    @IBOutlet weak var participantLabel: UILabel!
    
    func configure(group: FavGroupModel) {
        groupImageView.image = UIImage(named: group.imageOfGroup)
        titleGroupLable.text = group.title
        descriptionLable.text = group.description
        participantLabel.text = "Members: \(group.numbersOfParticipant)"
    }
    
}
