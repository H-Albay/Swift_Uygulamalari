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
    var UserEmailArry = [String] ()
    var UserImageArry = [String]()
    var UserCommentArry = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getDataFirebase()
        
    }
    func getDataFirebase() {
       let DataReference = Database.database().reference()
        DataReference.child("Users").observe(DataEventType.childAdded) { (snapshot) in
            //print("children: \(snapshot.children)")
            //print("key: \(snapshot.key)")
            //print("value: \(snapshot.value)")
            
            let values = snapshot.value! as! NSDictionary
            let post = values["post"] as! NSDictionary
            let postId = post.allKeys
            
            for id in postId {
                let singlePost = post[id] as! NSDictionary
                
                //let posttext = singlePost ["PostText"] as! String
                //print(posttext)
                self.UserEmailArry.append(singlePost["PostedBy"] as! String)
                self.UserCommentArry.append(singlePost["PostText"] as! String)
            }
            self.tableView.reloadData()
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserEmailArry.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for:
            indexPath ) as! FlowTVCell
        
        cell.UserEmailLabel.text = UserEmailArry [indexPath.row]
        cell.UserComment.text = UserCommentArry [indexPath.row]
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

