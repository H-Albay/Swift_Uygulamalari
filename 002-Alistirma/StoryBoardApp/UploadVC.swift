//
//  SecondViewController.swift
//  StoryBoardApp
//
//  Created by Hakan Albay on 14.04.2019.
//  Copyright © 2019 Hakan Albay. All rights reserved.
//

import UIKit
import Firebase

class UploadVC: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var commentText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.isUserInteractionEnabled=true
        let GesterRcgnzr=UITapGestureRecognizer(target: self, action: #selector(UploadVC.selectimage))
        imageView.addGestureRecognizer(GesterRcgnzr)
        
    }
    @objc func selectimage(){
        let pickerControl = UIImagePickerController()
        pickerControl.delegate=self
        pickerControl.sourceType = .photoLibrary
        pickerControl.allowsEditing=true
        present(pickerControl, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func postCilcked(_ sender: Any) {
        
        let storageRef = Storage.storage().reference()
        let mediaFolder = storageRef.child("media")
        
        if let data = imageView.image?.jpegData(compressionQuality: 0.5){
            let uuid = NSUUID().uuidString
            
            let mediaImageRef = mediaFolder.child("\(uuid).jpg")
            mediaImageRef.putData(data, metadata: nil) { (metadata, error) in
                if error != nil{
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                    let okbutton=UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
                    alert.addAction(okbutton)
                    self.present(alert,animated: true,completion: nil)
                }else{
                    mediaImageRef.downloadURL(completion: { (url, error) in
                        if error == nil {
                            //database işlemleri
                           let imageUrl = url?.absoluteString
                            let databaseReference = Database.database().reference()
                            
                            //let test = ["test1" : "test1" , "test2" : "test2" , "test3" : "test3"] as [String : Any]
                            //databaseReference.child("users").child((Auth.auth().currentUser?.uid)!).child("post").childByAutoId().setValue(test)
                            
                            let post = ["ImageURL" : imageUrl, "PostedBy":Auth.auth().currentUser?.email, "PostText" : self.commentText.text!,"uuid" : uuid]
                            databaseReference.child("Users").child("Userid:\((Auth.auth().currentUser?.uid)!)").child("post").childByAutoId().setValue(post)
                           
                            self.imageView.image = UIImage(named: "selectimage.png")
                            self.commentText.text = ""
                            self.tabBarController?.selectedIndex = 0
                            
                           // print("url: \(url?.absoluteString)")
                        }
                    })
                    
                }
                
            }
        }
        
        
    }
    
}

