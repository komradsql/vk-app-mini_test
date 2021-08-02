//
//  RegistrationViewController.swift
//  GB_lesson1-Volohin
//
//  Created by Евгений Волохин on 06.07.2021.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var futureLoginTextField: UITextField!
    @IBOutlet weak var futurePasswordTextField: UITextField!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var eyeButton: UIButton!
    
    var isSecureActive: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Create account"
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView?.addGestureRecognizer(tapGesture)
        
        createAccountButton.layer.cornerRadius = 10
        resetButton.layer.cornerRadius = 10
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        // Второе — когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Отписываемся от уведомлений о клавиатуре
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // здесь сделаю логику добавления нового пользователя в массив логин-пароль + пропуск по этим данным на экраны
    @IBAction func createAccountPressed(_ sender: Any) {
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        switch identifier {
        case "backToLogin":
            return true
        default:
            fatalError("Identifier не обнаружен")
        }
    }
    
    // Когда клавиатура появляется
    @objc private func keyboardWasShown(notification: Notification) {
        // Получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }

    //Когда клавиатура исчезает
    @objc private func keyboardWillBeHidden(notification: Notification) {
        // Устанавливаем отступ внизу UIScrollView, равный 0
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
    }

    @objc private func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
    
    
    @IBAction func eyeButtonPressed(_ sender: Any) {
        if isSecureActive {
            futurePasswordTextField.isSecureTextEntry = false
            eyeButton.setBackgroundImage(UIImage(systemName: "eye.fill"), for: .normal)
        } else {
            futurePasswordTextField.isSecureTextEntry = true
            eyeButton.setBackgroundImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        }
        isSecureActive.toggle()
    }
}
