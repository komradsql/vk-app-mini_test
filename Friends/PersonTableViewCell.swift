//
//  PersonTableViewCell.swift
//  VKAPP-Volohin
//
//  Created by Евгений Волохин on 09.07.2021.
//

import UIKit

final class PersonTableViewCell: UITableViewCell {
    
    static let reusedIdentifier = "PersonTableViewCell"
    
    @IBOutlet weak var avatarNameImageView: UIImageView!
    @IBOutlet weak var nameSurnameLabel: UILabel!
    @IBOutlet weak var isOnlineLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var mutualFriendsLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    var isAvatarAnimate: Bool = false
    
    @IBAction func profilePressed(_ sender: Any) {
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let cornerRadius: CGFloat = 60.0
        
        avatarNameImageView.layer.cornerRadius = cornerRadius
        avatarNameImageView.clipsToBounds = true
        
        containerView.layer.cornerRadius = cornerRadius
        containerView.layer.shadowColor = UIColor.darkGray.cgColor
        containerView.layer.shadowOffset = CGSize(width: 10.0, height: 10.0)
        containerView.layer.shadowRadius = 17.0
        containerView.layer.shadowOpacity = 1
        
        let tapOnAvatar = UITapGestureRecognizer(target: self, action: #selector(avatarTapped))
        tapOnAvatar.numberOfTapsRequired = 1
        avatarNameImageView.isUserInteractionEnabled = true
        avatarNameImageView.addGestureRecognizer(tapOnAvatar)
    }
    
    @objc func avatarTapped() {
        if isAvatarAnimate {
            springAnimateForAvatarOn()
        } else {
            springAnimateForAvatarOff()
        }
        isAvatarAnimate.toggle()
    }
    
    func springAnimateForAvatarOn() {
        UIView.animate(withDuration: 1,
                       delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 1,
                       options: []) {
            self.avatarNameImageView.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
            self.containerView.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        }
    }
    
    func springAnimateForAvatarOff() {
        UIView.animate(withDuration: 1,
                       delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 1,
                       options: []) {
            self.avatarNameImageView.transform = .identity
            self.containerView.transform = .identity
        }
    }

    func configure(person: PersonInListModel) {
        avatarNameImageView.image = UIImage(named: person.avatarName)
        nameSurnameLabel.text = person.nameSurname
        isOnlineLabel.text = person.isOnline
        cityLabel.text = person.city
        mutualFriendsLabel.text = "Mutual friends: \(person.mutualFriends)"
        
        switch isOnlineLabel.text {
        case "Online":
            isOnlineLabel.textColor = UIColor.green
        case "Offline":
            isOnlineLabel.textColor = UIColor.red
        default:
            isOnlineLabel.textColor = UIColor.black
        }
    }
    
    @IBInspectable var startWidthShadowRadius: CGFloat = 0 {
        didSet {
            self.updateColors()
        }
    }
    
    @IBInspectable var endWidthShadowRadius: CGFloat = 30.0 {
        didSet {
            self.updateColors()
        }
    }
    
    @IBInspectable var startColorOfShadow: UIColor = .white {
        didSet {
            self.updateColors()
        }
    }
    
    @IBInspectable var endColorOfShadow: UIColor = .black {
        didSet {
            self.updateColors()
        }
    }
    
    @IBInspectable var startShadowOpacity: CGFloat = 0 {
        didSet {
            self.updateShadowOpacity()
        }
    }
    
    @IBInspectable var endShadowOpacity: CGFloat = 1 {
        didSet {
            self.updateShadowOpacity()
        }
    }
    
    var gradientLayer: CAGradientLayer {
        return self.layer as! CAGradientLayer
    }
    
    func updateColors() {
        self.gradientLayer.colors = [self.startColorOfShadow.cgColor, self.endColorOfShadow.cgColor]
    }
    
    func updateWidthShadow() {
        self.gradientLayer.locations = [self.startWidthShadowRadius as NSNumber, self.endWidthShadowRadius as NSNumber]
    }
    
    func updateShadowOpacity() {
        self.gradientLayer.locations = [self.startShadowOpacity as NSNumber, self.endShadowOpacity as NSNumber]
    }
}
