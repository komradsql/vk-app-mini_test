//
//  ViewController.swift
//  GB_lesson1-Volohin
//
//  Created by Евгений Волохин on 05.07.2021.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var madeAccountButton: UIButton!
    @IBOutlet weak var eyeButton: UIButton!
    
    var isSecureActive: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Authorization"
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView?.addGestureRecognizer(tapGesture)
        
        loginButton.layer.cornerRadius = 10
        madeAccountButton.layer.cornerRadius = 10
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let navbar = navigationController?.navigationBar
        navbar?.isHidden = true
        
        // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        // Второе — когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Отписываемся от уведомлений о клавиатуре
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    struct UserCredentials {
        let login: String
        let password: String
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        switch identifier {
        case "correctLogin":
            guard let login = loginTextField.text, !login.isEmpty,
                  let password = passwordTextField.text, !password.isEmpty
            else {
                showErrorAlert(message: "The fields are empty")
                return false
            }
            let credentials = UserCredentials (login: login, password: password)
            guard areCredentialsCorrect(credentials) else {
                showErrorAlert(message: "Enter correct password or login")
                return false
            }
            clearTextFields()
            return true
        case "signUp":
            clearTextFields()
            return true
        default:
            showErrorAlert(message: "Identifire не обнаружен")
            return false
        }
    }
    
    private func areCredentialsCorrect(_ credentials: UserCredentials) -> Bool {
        credentials.login == "1" && credentials.password == "1"
    }
        
    func clearTextFields() {
        loginTextField.text = ""
        passwordTextField.text = ""
    }
    
    func showErrorAlert(message: String) {
        let ac = UIAlertController(title: "Error", message: message, preferredStyle: .alert)

        let clearFields = UIAlertAction(title: "OK", style: .default) { _ in
            self.loginTextField.text = ""
            self.passwordTextField.text = ""
        }
        
        ac.addAction(clearFields)
        present(ac, animated: true)
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
            passwordTextField.isSecureTextEntry = false
            eyeButton.setBackgroundImage(UIImage(systemName: "eye.fill"), for: .normal)
        } else {
            passwordTextField.isSecureTextEntry = true
            eyeButton.setBackgroundImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        }
        isSecureActive.toggle()
    }
}

