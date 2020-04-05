//
//  HomeVC.swift
//  UserDefaultsApplication
//
//  Created by Sarveshwar Reddy on 03/04/20.
//  Copyright © 2020 Sarveshwar Reddy. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    var myhomedict = [String: String]()
    var defaults = UserDefaults.standard
    var homeEmail = ""
    var homePassword = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func logoutButton(_ sender: UIButton) {
        myhomedict = defaults.value(forKey: "UserDetails") as! [String : String]
        
        myhomedict.removeValue(forKey: homeEmail)
        defaults.set(myhomedict, forKey: "UserDetails")
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ViewController") as? ViewController
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
}
