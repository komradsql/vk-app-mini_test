//
//  AlphabetPicker.swift
//  VKAPP-Volohin
//
//  Created by Евгений Волохин on 14.07.2021.
//

import UIKit
    // этот пикер нам в данный момент не нужен, но пусть лежит. из сториборда он удалён.
class AlphabetPicker: UIControl {
    
    var selectedCharacter: Character? = nil {
        didSet {
            self.updateSelectedCharacter()
            self.sendActions(for: .valueChanged)
        }
    }
    
    private var buttons: [UIButton] = []
    private var stackView: UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }
    
    private func setupView() {
        for character in Character.allCharacters {
            let button = UIButton(type: .system)
            button.setTitle(character.title, for: .normal)
            button.setTitleColor(.systemBlue, for: .normal)
            button.setTitleColor(.white, for: .selected)
            button.addTarget(self, action: #selector(selectCharacter(_:)), for: .touchUpInside)
            self.buttons.append(button)
        }
        
        stackView = UIStackView(arrangedSubviews: self.buttons)
        
        self.addSubview(stackView)
        
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
    }
    
    @objc func selectCharacter(_ sender: UIButton) {
        guard let index = self.buttons.firstIndex(of: sender) else { return }
        guard let character = Character(rawValue: index) else { return }
        self.selectedCharacter = character
    }
    
    private func updateSelectedCharacter() {
        for (index, button) in self.buttons.enumerated() {
            guard let character = Character(rawValue: index) else { continue }
            button.isSelected = character == self.selectedCharacter
        }
    }
}

enum Character: Int {
    case A
    case B
    case C
    case D
    case E
    case F
    case G
    case H
    case I
    case J
    case K
    case L
    case M
    case N
    case O
    case P
    case Q
    case R
    case S
    case T
    case U
    case V
    case W
    case X
    case Y
    case Z
    
    static let allCharacters: [Character] = [A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z]
    
    var title: String {
        switch self {
        case .A: return "A"
        case .B: return "B"
        case .C: return "C"
        case .D: return "D"
        case .E: return "E"
        case .F: return "F"
        case .G: return "G"
        case .H: return "H"
        case .I: return "I"
        case .J: return "J"
        case .K: return "K"
        case .L: return "L"
        case .M: return "M"
        case .N: return "N"
        case .O: return "O"
        case .P: return "P"
        case .Q: return "Q"
        case .R: return "R"
        case .S: return "S"
        case .T: return "T"
        case .U: return "U"
        case .V: return "V"
        case .W: return "W"
        case .X: return "X"
        case .Y: return "Y"
        case .Z: return "Z"
        }
    }
}
