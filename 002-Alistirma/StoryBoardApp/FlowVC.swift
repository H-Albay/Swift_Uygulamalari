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
class FlowVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for:
            indexPath ) as! FlowTVCell
        return cell
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

