//
//  ViewController.swift
//  UserDefaultsApplication
//
//  Created by Sarveshwar Reddy on 03/04/20.
//  Copyright © 2020 Sarveshwar Reddy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var emailTextLogin: UITextField!
    @IBOutlet weak var passwordTextLogin: UITextField!
    @IBOutlet weak var InvalidEandP: UILabel!
    var userEmail = String()
    var userPassword = String()
    var userMobileNumber = Int()
    var defaults = UserDefaults.standard
    var myuserdict = [String: String]()
    var emailText = ""
    var passwordText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        
//        self.emailText = emailTextLogin.text!
//        self.passwordText = passwordTextLogin.text!
        
        var userEmailid = emailTextLogin.text
        var userEmail = emailTextLogin.text
        var userMobileNumber = emailTextLogin.text!
        var userPassword  = passwordTextLogin.text
        
        
        let isUserDefaultsExists = isKeyPresentInUserDefaults(key: "UserDetails")
        if isUserDefaultsExists {
            myuserdict = defaults.value(forKey: "UserDetails") as! [String : String]
            let keyExists = myuserdict[userEmail!] != nil
            let keyExistss = myuserdict[userMobileNumber] != nil
            print(keyExists)
            print(keyExistss)
            if (keyExists == true) && (keyExistss == true){
                let password = myuserdict[userEmail!]
                if userPassword == password{
                    UserDefaults.standard.set(userEmailid, forKey: "UserEmailID")
                    let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "TabBar") as? TabBar
                    self.navigationController?.pushViewController(vc!, animated: true)
                }else{
                    InvalidEandP.text = "Invalid Email and Password (Please Register)"
                }
                
            }else{
                InvalidEandP.text = "Invalid Email (Please Register)"
            }
            
        }
        else{
            InvalidEandP.text = "Invalid Email and Password (Please Register)"
        }
        
        
        
        
        
        
        
        //
        //        if  userEmail == myuserdict[userEmail!] as? String
        //        {
        //            if userPassword == myuserdict[userPassword!] as? String{
        //
        //                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "HomeVC") as? HomeVC
        //                self.navigationController?.pushViewController(vc!, animated: true)
        //
        //            }
        //            else{
        //                InvalidEandP.text = "Invalid Email and Password (Please Register)"
        //            }
        //        }else{
        //            InvalidEandP.text = "Invalid Email (Please Register)"
        //        }
        //
        //
        
        
        //        var userEmailStored = UserDefaults.standard.string(forKey: "UserDetails")
        //        var userPasswordStroed = UserDefaults.standard.string(forKey: "UserDetails")
        //        print("Email is\(userEmailStored)")
        //        print("Password is\(userPasswordStroed)")
        //
        //        if userEmail == userEmailStored && userPassword == userPasswordStroed {
        //            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "HomeVC") as? HomeVC
        //            self.navigationController?.pushViewController(vc!, animated: true)
        //
        //
        //        }else{
        //            InvalidEandP.text = "Invalid Email and Password (Please Register)"
        //        }
        
        if (userEmail!.isEmpty || userPassword!.isEmpty){
            
            let alert = UIAlertController(title: "Please enter your email and password", message: "", preferredStyle: UIAlertController.Style.alert)
            // add the actions (buttons)
            alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc = segue.destination as! HomeVC
        vc.homeEmail = self.emailText
        vc.homePassword = self.passwordText
    }
    
    
    
    @IBAction func sigupButton(_ sender: UIButton) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "RegistrationVC") as? RegistrationVC
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    
    //    override func viewDidAppear(_ animated: Bool) {
    //
    //
    //        var userEmail = emailTextLogin.text
    //            var userPassword  = passwordTextLogin.text
    //
    //            var userEmailStored = UserDefaults.standard.string(forKey: "userEmail")
    //            var userPasswordStroed = UserDefaults.standard.string(forKey: "userPassword")
    ////            print(userPasswordStroed)
    ////            print(userEmailStored)
    ////
    //            if userEmail == userEmailStored && userPassword == userPasswordStroed {
    //                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "HomeVC") as? HomeVC
    //                       self.navigationController?.pushViewController(vc!, animated: true)
    //            }
    //
    //    }
    
    
    func isKeyPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
}

