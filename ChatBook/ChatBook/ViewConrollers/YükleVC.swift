//
//  YükleVC.swift
//  ChatBook
//
//  Created by Hakan Albay on 20.09.2019.
//  Copyright © 2019 Hakan Albay. All rights reserved.
//

import UIKit

class Yu_kleVC: UIViewController ,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var uploadImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uploadImageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(choosePicture))
        uploadImageView.addGestureRecognizer(gestureRecognizer)
       
    }
    @IBAction func uploadClicked(_ sender: Any) {
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
