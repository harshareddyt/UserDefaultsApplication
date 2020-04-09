//
//  AccountsViewController.swift
//  UserDefaultsApplication
//
//  Created by Sarveshwar Reddy on 07/04/20.
//  Copyright © 2020 Sarveshwar Reddy. All rights reserved.
//

import UIKit

class AccountsViewController: UIViewController {

    @IBOutlet weak var gmailIdLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gmailIdLabel.text =  UserDefaults.standard.string(forKey: "UserEmailID")


       
    }
    

}
