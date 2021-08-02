//
//  PhotosCollectionViewCell.swift
//  VKAPP-Volohin
//
//  Created by Евгений Волохин on 11.07.2021.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PhotosCollectionViewCell"
    
    @IBOutlet weak var mainPhoto: UIImageView!
    @IBOutlet weak var mainLabel: UILabel!
    
    var isInScale: Bool = false
        
    func configure(photo: PhotosInProfile) {
        mainPhoto.image = UIImage(named: photo.mainPhoto)
        mainLabel.text = "Date: \(photo.date)"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(imageDoubleTapped))
        doubleTap.numberOfTapsRequired = 2
        mainPhoto.isUserInteractionEnabled = true
        mainPhoto.addGestureRecognizer(doubleTap)
    }
    
    @objc func imageDoubleTapped() {
        if isInScale {
            springAnimateForScalePhotoOff()
        } else {
            springAnimateForScalePhotoOn()
        }
        isInScale.toggle()
    }
    
    func springAnimateForScalePhotoOn() {
        UIView.animate(withDuration: 1,
                       delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 1,
                       options: []) {
            self.mainPhoto.transform = CGAffineTransform(scaleX: 1.4, y: 1.4)
        }
    }
    
    func springAnimateForScalePhotoOff() {
        UIView.animate(withDuration: 1,
                       delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 1,
                       options: []) {
            self.mainPhoto.transform = .identity
        }
    }
}
