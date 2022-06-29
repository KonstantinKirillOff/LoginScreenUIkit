//
//  ViewController.swift
//  LoginScreenUIkit
//
//  Created by Konstantin Kirillov on 27.06.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let userName = "Alex"
    private let password = "123"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextField.delegate = self
        userNameTextField.autocorrectionType = .no
        userNameTextField.textContentType = .nickname
        userNameTextField.returnKeyType = .next

        passwordTextField.delegate = self
        passwordTextField.isSecureTextEntry = true
        passwordTextField.returnKeyType = .done
        passwordTextField.enablesReturnKeyAutomatically = true
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomVC = segue.destination as? WelcomViewController else { return }
        welcomVC.nickname = userNameTextField.text
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }

    
    @IBAction func logInPressed() {
        checkUserData()
    }
    
    @IBAction func forgotPressedButtons(_ sender: UIButton) {
        if sender.tag == 1 {
            showAlertWith(title: "Don't forget! There is your user name:", hint: userName)
        } else {
            showAlertWith(title: "Don't forget! There is your password:", hint: password)
        }
    }
    
}

extension LoginViewController {
    private func showAlertWith(title: String, hint: String, errorData: Bool = false) {
        let alertController = UIAlertController(title: title, message: hint, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default) { UIAlertAction in
            if errorData {
                self.passwordTextField.text = ""
            }
        }
        
        alertController.addAction(alertAction)
        present(alertController, animated: true)
        
    }
    
    private func checkUserData() -> Bool {
        if userNameTextField.text != userName ||
            passwordTextField.text != password {
            showAlertWith(title: "Ooops!", hint: "Not correct login or password", errorData: true)
            return false
        } else {
            return true
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switchNextTextField(textField)
        return true
    }
    
    private func switchNextTextField(_ textField: UITextField) {
        if textField == userNameTextField {
            
            passwordTextField.becomeFirstResponder()
        } else {
            //passwordTextField.resignFirstResponder()
            if checkUserData() {
                performSegue(withIdentifier: "welcomeSugue", sender: nil)
            }
        }
    }
}

