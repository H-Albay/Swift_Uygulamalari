//
//  ViewController.swift
//  KullanıcıFormu
//
//  Created by Hakan Albay on 14.05.2019.
//  Copyright © 2019 Hakan Albay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var trypasswordTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func saveClick(_ sender: Any) {
        if userTxt.text == "" {
            let alert = UIAlertController (title: "Hata Mesajı", message: "Kullanıcı adı boş görünüyor.", preferredStyle:  .alert)
            let button = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(button)
            self.present(alert, animated: true, completion: nil)
        }
        else if passwordTxt.text == ""{
            let alert = UIAlertController(title: "Hata Mesajı", message: "Parola alanı boş görünüyor.", preferredStyle: UIAlertController.Style.alert)
            let button = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(button)
            self.present(alert, animated: true, completion: nil)
        }
        else if passwordTxt.text != trypasswordTxt.text {
            let alert = UIAlertController(title: "Hata Mesajı", message: "Parolalar eşleşmiyor!", preferredStyle: UIAlertController.Style.alert)
            let button = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(button)
            self.present(alert, animated: true, completion: nil)
        }
        else{
            let alert = UIAlertController(title: "Başarılı!", message: "Sunucu ile bağlantı kuruluyor..", preferredStyle: UIAlertController.Style.alert)
            let button = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(button)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
}

