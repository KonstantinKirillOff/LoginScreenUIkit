//
//  AboutMeViewController.swift
//  LoginScreenUIkit
//
//  Created by Konstantin Kirillov on 04.07.2022.
//

import UIKit

class AboutMeViewController: UIViewController {
    
    @IBOutlet weak var photoImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    var person: Person!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoImage.image = UIImage(named: person.photo)
        nameLabel.text = "Name: \(person.name)"
        lastNameLabel.text = "Last name: \(person.lastName)"
        phoneLabel.text = "Phone: \(person.phone)"

    }

}
