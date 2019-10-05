//
//  AyarlarVC.swift
//  ChatBook
//
//  Created by Hakan Albay on 20.09.2019.
//  Copyright © 2019 Hakan Albay. All rights reserved.
//

import UIKit
import Firebase
class AyarlarVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   
    @IBAction func CıkısTıkla(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toSingninVC", sender: nil)
        } catch  {
                
        }
    }
    
}
