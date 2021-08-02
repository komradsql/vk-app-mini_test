//
//  LikeControl.swift
//  VKAPP-Volohin
//
//  Created by Евгений Волохин on 14.07.2021.
//

import UIKit

class LikeControl: UIControl {
    
    var imageView = UIImageView()
    var likeCounterLabel = UILabel()
    
    var likeCounter: Int = 0
    var isLike: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
    }
    
    func setLikes(count: Int) {
        likeCounter = count
        setLikeCounterLabel()
    }
    
    func setView() {
        self.addSubview(imageView)
        self.addTarget(self, action: #selector(tapControl), for: .touchUpInside)
        
        imageView.tintColor = .blue
        imageView.image = UIImage(systemName: "heart")
        
        setLikeCounterLabel()
    }
    
    func setLikeCounterLabel() {
        addSubview(likeCounterLabel)
        var likeString: String?
        
        switch likeCounter {
        case 0..<1000:
            likeString = String(self.likeCounter)
        case 1000..<1_000_000:
            likeString = String(self.likeCounter / 1000) + "K"
        default:
            likeString = "-"
        }
        UIView.transition(with: likeCounterLabel,
                          duration: 0.2,
                          options: .transitionFlipFromTop,
                          animations: { [unowned self] in self.likeCounterLabel.text = String(likeString!) })
    
        likeCounterLabel.textColor = .blue
        likeCounterLabel.font = UIFont.systemFont(ofSize: 23)
        likeCounterLabel.translatesAutoresizingMaskIntoConstraints = false
        likeCounterLabel.trailingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: -8).isActive = true
        likeCounterLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
    }
    
    @objc func tapControl() {
        isLike.toggle()
        if isLike {
            imageView.image = UIImage(systemName: "heart.fill")
            likeCounter += 1
            setLikeCounterLabel()
        } else {
            imageView.image = UIImage(systemName: "heart")
            likeCounter -= 1
            setLikeCounterLabel()
        }
    }
}
