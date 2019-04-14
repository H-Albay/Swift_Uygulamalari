//
//  SigninVC.swift
//  StoryBoardApp
//
//  Created by Hakan Albay on 14.04.2019.
//  Copyright © 2019 Hakan Albay. All rights reserved.
//

import UIKit

class SigninVC: UIViewController {

    @IBOutlet weak var userlabel: UITextField!
    @IBOutlet weak var passwordlabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func SiginClick(_ sender: Any) {
        performSegue(withIdentifier: "toTabBar", sender: nil)
    }
    
    @IBAction func SignupClick(_ sender: Any) {
    }
    

}
