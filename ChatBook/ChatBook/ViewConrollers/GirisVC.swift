//
//  ViewController.swift
//  ChatBook
//
//  Created by Hakan Albay on 16.09.2019.
//  Copyright © 2019 Hakan Albay. All rights reserved.
//

import UIKit
import Firebase
class GirisVC: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var userText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signInClicked(_ sender: Any) {
        if emailText.text != "" && passwordText.text != "" {
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { (result, error) in
                if error != nil {
                     self.makeAlert(title: "Hata", message: "Kullanıcı bulunamadı.Email yada şifre hatalı girilmiş olabilir.Tekrar deneyiniz.")
                }
                else {
                   self.performSegue(withIdentifier: "AkışVC", sender: nil)
                }
            }
        }
    }
    @IBAction func signUpClicked(_ sender: Any) {
        if userText.text != "" && passwordText.text != "" && emailText.text != "" {
            //Firebase ile kullanıcı oluşturma
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { (auth, error) in
                if error != nil {
                    self.makeAlert(title: "Hata", message: error?.localizedDescription ?? "Hata Oluştu.")
                }else{
                    let fireStore = Firestore.firestore()
                    let userDictionary = ["Email":self.emailText.text!,"KullanıcıAdı":self.userText.text!,"Şifre":self.passwordText.text!] as [String :Any]
                    fireStore.collection("Kullanıcı Bilgileri").addDocument(data: userDictionary) { (error) in
                        if error != nil{
                            //
                        }
                        self.performSegue(withIdentifier: "AkışVC", sender: nil)
                    }
                }
            }
            
            
        }else {
            makeAlert(title: "Hata", message: "Email/KullanıcıAdı/Şifre doğru değil!")
        }
    }
    func makeAlert(title: String , message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okbutton = UIAlertAction (title: "Tamam", style: .default, handler: nil)
        alert.addAction(okbutton)
        self.present(alert,animated: true,completion: nil)
        
    }
    
}

