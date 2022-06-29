//
//  WelcomViewController.swift
//  LoginScreenUIkit
//
//  Created by Konstantin Kirillov on 27.06.2022.
//

import UIKit

class WelcomViewController: UIViewController {
    
    @IBOutlet weak var greetingLabel: UILabel!
    
    var nickname: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        greetingLabel.text = "\(greetingLabel.text ?? "") \(nickname ?? "")"

    }


}
