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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextField.autocorrectionType = .no
        userNameTextField.textContentType = .nickname
        passwordTextField.isSecureTextEntry = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
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
        if userNameTextField.text != "Alex" ||
            passwordTextField.text != "123" {
            showAlertWith(title: "Ooops!", hint: "Not correct login or password", errorData: true)
        }
    }
    
    @IBAction func forgotPressedButtons(_ sender: UIButton) {
        if sender.tag == 1 {
            showAlertWith(title: "Don't forget! There is your user name:", hint: "Alex")
        } else {
            showAlertWith(title: "Don't forget! There is your password:", hint: "123")
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
}

