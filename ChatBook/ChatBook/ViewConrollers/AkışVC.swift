//
//  AkışVC.swift
//  ChatBook
//
//  Created by Hakan Albay on 20.09.2019.
//  Copyright © 2019 Hakan Albay. All rights reserved.
//

import UIKit
import Firebase
class Ak_s_VC: UIViewController {

    let fireStoreDatabase = Firestore.firestore()
    @IBOutlet weak var tableViews: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        getUserInfo()
    }
    
    func getUserInfo(){
        fireStoreDatabase.collection("Kullanıcı Bilgileri").whereField("Email", isEqualTo: Auth.auth().currentUser!.email!).getDocuments { (snapshot, error) in
            if error != nil {
                self.makeAlert(title: "Hata", message: error?.localizedDescription ?? "Hata!")
                }else{
                if snapshot?.isEmpty == false && snapshot != nil {
                    for document in snapshot!.documents{
                        if let KullanıcıAdı = document.get("KullanıcıAdı") as? String{
                            UserSingleton.sharedUserInfo.email = Auth.auth().currentUser!.email!
                            UserSingleton.sharedUserInfo.kullanıcıadı = KullanıcıAdı
                        }
                    }
                }
                
            }
        }
    }
    
    func makeAlert(title: String , message: String) {
          let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
          let okbutton = UIAlertAction (title: "Tamam", style: .default, handler: nil)
          alert.addAction(okbutton)
          self.present(alert,animated: true,completion: nil)
      }


}
