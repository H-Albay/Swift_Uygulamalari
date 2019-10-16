//
//  YükleVC.swift
//  ChatBook
//
//  Created by Hakan Albay on 20.09.2019.
//  Copyright © 2019 Hakan Albay. All rights reserved.
//

import UIKit
import Firebase
class Yu_kleVC: UIViewController ,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var uploadImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uploadImageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(choosePicture))
        uploadImageView.addGestureRecognizer(gestureRecognizer)
       
    }
    @IBAction func uploadClicked(_ sender: Any) {
        //Storage
        let storage = Storage.storage()
        let storageRef = storage.reference()
        let mediaFolder = storageRef.child("Medya")
        if let data = uploadImageView.image?.jpegData(compressionQuality: 0.5) {
            let uuid = UUID().uuidString
            let imageRef = mediaFolder.child("\(uuid).jpg")
            imageRef.putData(data, metadata: nil) { (metadata, error) in
                if error != nil {
                    self.makeAlert(title: "Hata", message: error?.localizedDescription ?? "Hata")
                }else{
                    imageRef.downloadURL { (url, error) in
                        if error == nil {
                            let imageUrl = url?.absoluteString
                            //Firestore
                            let fireStore = Firestore.firestore()
                            
                            fireStore.collection("Medyalar").whereField("Medya Kullanıcısı", isEqualTo: UserSingleton.sharedUserInfo.kullanıcıadı).getDocuments { (medya, error) in
                                if error != nil {
                                    self.makeAlert(title: "Hata", message: error?.localizedDescription ?? "Hata")
                                }else{
                                    if medya?.isEmpty == false && medya !=  nil {
                                        for document in medya!.documents {
                                            let documentId = document.documentID
                                            
                                            if var URL_Dizisi = document.get("URL_Dizisi") as? [String] {
                                                URL_Dizisi.append(imageUrl!)
                                                
                                                let additionalDictionary = ["URL_Dizisi":URL_Dizisi] as [String : Any]
                                                
                                                
                                                fireStore.collection("Medyalar").document(documentId).setData(additionalDictionary, merge: true) { (error) in
                                                    if error != nil {
                                                        self.tabBarController?.selectedIndex = 0
                                                        self.uploadImageView.image = UIImage(named: "Yükleme Ekranı.png")
                                                    }
                                                }
                                                
                                                
                                            }
                                        }
                                    }else {
                                        let medyahakkında = ["URL_Dizisi" : [imageUrl!],"Medya Kullanıcısı": UserSingleton.sharedUserInfo.kullanıcıadı,"Tarih": FieldValue.serverTimestamp()] as [String : Any]
                                        fireStore.collection("Medyalar").addDocument(data: medyahakkında) { (error) in
                                            if error != nil {
                                                self.makeAlert(title: "Hata", message: error?.localizedDescription ?? "Hata")
                                            } else {
                                                //Tabbarda indexleme mevcuttur burada anasayfa gidicek.
                                                self.tabBarController?.selectedIndex = 0
                                                self.uploadImageView.image=UIImage(named: "Yükleme Ekranı.png")
                                            }
                                        }
                                        
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
            
        }
        
    }
    func makeAlert (title: String,message: String){
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction.init(title: "Tamam", style: .default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
    }
    @objc func choosePicture () {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        self.present(picker,animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        uploadImageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
  

}


