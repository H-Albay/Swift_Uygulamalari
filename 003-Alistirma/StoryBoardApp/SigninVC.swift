//
//  SigninVC.swift
//  StoryBoardApp
//
//  Created by Hakan Albay on 14.04.2019.
//  Copyright © 2019 Hakan Albay. All rights reserved.
//

import UIKit
import FirebaseAuth

class SigninVC: UIViewController {

    @IBOutlet weak var userlabel: UITextField!
    @IBOutlet weak var passwordlabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func SiginClick(_ sender: Any) {
        if userlabel.text != "" && passwordlabel.text != ""{
            Auth.auth().signIn(withEmail: userlabel.text!, password: passwordlabel.text!) { (userdata, error) in
                if error != nil {
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                    let okbutton=UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
                    alert.addAction(okbutton)
                    self.present(alert,animated: true,completion: nil)
                }else{
                    //self.performSegue(withIdentifier: "toTabBar", sender: nil)
                    UserDefaults.standard.set(userdata!.user.email, forKey: "user")
                    UserDefaults.standard.synchronize()
                    //appdelegate ile bağlantı kurma
                    let delegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
                    delegate.remeberUser()
                }
            }
        }
      
       
    }
    
    @IBAction func SignupClick(_ sender: Any) {
        
        if userlabel.text != "" && passwordlabel.text != ""{
            
            Auth.auth().createUser(withEmail: userlabel.text!, password: passwordlabel.text!) { (userdata, error) in
                if error != nil {
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                    let okbutton=UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
                    alert.addAction(okbutton)
                    self.present(alert,animated: true,completion: nil)
                }else{
                    //self.performSegue(withIdentifier: "toTabBar", sender: nil)
                    UserDefaults.standard.set(userdata!.user.email, forKey: "user")
                    UserDefaults.standard.synchronize()
                    //appdelegate ile bağlantı kurma
                    let delegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
                    delegate.remeberUser()
                }
                
            }
        }else{
            let alert = UIAlertController(title: "Error", message: "username or password error", preferredStyle: UIAlertController.Style.alert)
            let okbutton=UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okbutton)
            self.present(alert,animated: true,completion: nil)
        }
        
       
    }
    
}
    


