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
        <#code#>
    }


}

