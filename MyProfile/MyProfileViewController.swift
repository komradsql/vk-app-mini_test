//
//  MyProfileViewController.swift
//  VKAPP-Volohin
//
//  Created by Евгений Волохин on 11.07.2021.
//

import UIKit

final class MyProfileViewController: UIViewController {
    
    @IBOutlet weak var profileAvatarImageView: UIImageView!
    @IBOutlet weak var profileNameSurnameLabel: UILabel!
    @IBOutlet weak var profileStatusLabel: UILabel!
    @IBOutlet weak var profileAboutLabel: UILabel!
    @IBOutlet weak var profileInterestsLabel: UILabel!
    @IBOutlet weak var profileFavImageLabel: UILabel!
    @IBOutlet weak var firstFavImage: UIImageView!
    @IBOutlet weak var secondFavImage: UIImageView!
    @IBOutlet weak var thirdFavImage: UIImageView!
    
    var profile = [PersonalProfileModel]()
    var favPhotosInProfile = [FavPhotosInProfileModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profile = PersonalProfileStorage().personalInfo
        favPhotosInProfile = PersonalPhotosStorage().personalPhotos
        
        let currentProfile = profile[0]
        let currentPhotos = favPhotosInProfile[0]
        
        makeProfileInfo(profile: currentProfile)
        fillProfileWithPhoto(profilePhotos: currentPhotos)
    }
     
    func makeProfileInfo(profile: PersonalProfileModel) {
        profileAvatarImageView.image = UIImage(named: profile.profileAvatar)
        profileNameSurnameLabel.text = profile.profileNameSurname
        profileStatusLabel.text = profile.profileStatus
        profileAboutLabel.text = profile.profileAbout
        profileInterestsLabel.text = "Interests: \(profile.profileInterests)"
        profileFavImageLabel.text = profile.profileFavImage
        
        profileStatusLabel.textColor = .red
    }
    
    // пока что этот метод не работает
    func fillProfileWithPhoto(profilePhotos: FavPhotosInProfileModel) {
        firstFavImage.image = UIImage(named: profilePhotos.firstPhoto)
        secondFavImage.image = UIImage(named: profilePhotos.secondPhoto)
        thirdFavImage.image = UIImage(named: profilePhotos.thirdPhoto)
    }
    
    @IBAction func exitButtonPressed(_ sender: Any) {
        let ac = UIAlertController(title: "Are you sure?", message: "You will be redirected to Login screen", preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "Yes", style: .default, handler: { _ -> Void in
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! ViewController
            self.present(nextViewController, animated: true, completion: nil)
        })
        let actionCancel = UIAlertAction(title: "Cancel", style: .default)
        ac.addAction(actionOk)
        ac.addAction(actionCancel)
        present(ac, animated: true)
    }
    
    
}
