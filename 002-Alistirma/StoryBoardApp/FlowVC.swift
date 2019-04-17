//
//  FirstViewController.swift
//  StoryBoardApp
//
//  Created by Hakan Albay on 14.04.2019.
//  Copyright © 2019 Hakan Albay. All rights reserved.
//

import UIKit
import  Firebase
import FirebaseAuth
class FlowVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func LogoutClick(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "user")
        UserDefaults.standard.synchronize()
        
        let signIn=storyboard?.instantiateViewController(withIdentifier: "signin") as! SigninVC
        let delegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
        delegate.window?.rootViewController = signIn
        delegate.remeberUser()
        
        do {
            try Auth.auth().signOut()
        } catch  {
            print("error")
        }
            
        
            
        
    }
    
}

