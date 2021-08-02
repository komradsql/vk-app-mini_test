//
//  ParticipantsViewController.swift
//  VKAPP-Volohin
//
//  Created by Евгений Волохин on 13.07.2021.
//

import UIKit

final class ParticipantsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var participants: [AllPeopleInGroupModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension ParticipantsViewController: UICollectionViewDelegate {
}

extension ParticipantsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        participants.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ParticipantsCollectionViewCell.identifier, for: indexPath) as! ParticipantsCollectionViewCell
        let participant = participants[indexPath.item]
        cell.configure(participant: participant)
        
        return cell
    }
}
