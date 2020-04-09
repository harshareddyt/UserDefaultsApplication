//
//  RegistrationVC.swift
//  UserDefaultsApplication
//
//  Created by Sarveshwar Reddy on 03/04/20.
//  Copyright © 2020 Sarveshwar Reddy. All rights reserved.
//

import UIKit

class RegistrationVC: UIViewController {
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var mobileNumberText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var rePasswordText: UITextField!
    @IBOutlet weak var passwordMatchLabel: UILabel!
    
    
    var defaults = UserDefaults.standard
    var userPassword = String()
    var userRePassword = String()
    var userEmail = String()
    var userMobileNumber = Int()
    var mydict = [String: String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        isValidEmail(emailText.text!)
        passwordText.isSecureTextEntry.toggle()
        rePasswordText.isSecureTextEntry.toggle()
        
    }
    
    @IBAction func signUpButton(_ sender: UIButton) {
        
        var userEmail = emailText.text;
        var userPassword = passwordText.text;
        var userMobileNumber = mobileNumberText.text;
        var userRePassword = rePasswordText.text;
        
        
        let email  = isValidEmail(userEmail!)
        let password = isValidPassword(userPassword!)
        
        if(userEmail!.isEmpty || userMobileNumber!.isEmpty || userPassword!.isEmpty || userRePassword!.isEmpty){
            passwordMatchLabel.text = "Please fill all the Fields "
        }else if email == false{
            let alert = UIAlertController(title: "Invalid Email Address", message: "", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default){action in
                alert.dismiss(animated: false, completion: nil)
            }
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
            
        } else if password == false{
            let alert = UIAlertController(title: "Invalid Password ", message: "", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default){action in
                alert.dismiss(animated: false, completion: nil)
            }
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        } else {
            
            if userPassword == userRePassword {
                passwordMatchLabel.text = "Password Matched"
                
                let isUserDefaultsExists = isKeyPresentInUserDefaults(key: "UserDetails")
                
                var keyExists = false
                if isUserDefaultsExists {
                    mydict = defaults.value(forKey: "UserDetails") as! [String : String]
                    keyExists = mydict[userEmail!] != nil
                }
                
                var keyExistss = false
                if isUserDefaultsExists {
                    mydict = defaults.value(forKey: "UserDetails") as! [String : String]
                    keyExistss = mydict[userMobileNumber!] != nil
                }
                
                if(keyExistss == false) && (keyExists == false) {
                                   mydict[userEmail!] = userPassword
                                   mydict[userMobileNumber!] = userPassword
                                   defaults.set(mydict, forKey: "UserDetails")
                                   
                                   let alert = UIAlertController(title: "SuccesFully Registerd", message: "", preferredStyle: UIAlertController.Style.alert)
                                   // add the actions (buttons)
                                   let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default){action in
                                       let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                                       self.present(vc, animated: true, completion: nil)
                                   }
                                   alert.addAction(okAction)
                                   self.present(alert, animated: true, completion: nil)
                                   
                               }else{
                    
                    let alert = UIAlertController(title: "This Email already Exits", message: "", preferredStyle: UIAlertController.Style.alert)
                    // add the actions (buttons)
                    let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default){action in
                        alert.dismiss(animated: false, completion: nil)
                    }
                    alert.addAction(okAction)
                    self.present(alert, animated: true, completion: nil)
                }
            }
                
            else {
                let alert = UIAlertController(title: "Password does not Matched", message: "", preferredStyle: UIAlertController.Style.alert)
                // add the actions (buttons)
                let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default){action in
                    alert.dismiss(animated: false, completion: nil)
                }
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    func isKeyPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
        
    }
    
    func isValidPassword(_ password: String) -> Bool {
        var result = false
        if password.count==8 {
            result = true
        }
        return result
    }
}
