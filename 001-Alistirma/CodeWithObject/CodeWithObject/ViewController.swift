//
//  ViewController.swift
//  CodeWithObject
//
//  Created by Hakan Albay on 24.04.2019.
//  Copyright © 2019 Hakan Albay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 let mylabel=UILabel()
 let mybutton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Amacım storyboard kullanmadan bir label bir buttonu kod ile oluşturmak.
        //Button tıklanınca label değişmeli
        let width = view.frame.size.width
        let height = view.frame.size.height
        
       
        mylabel.text="Test Label"
        mylabel.textAlignment = .center
        mylabel.frame = CGRect(x: width * 0.25 , y: height * 0.35, width: width * 0.5, height: height * 0.2)
        view.addSubview(mylabel)
        
        
        mybutton.frame = CGRect(x: width * 0.35, y: height * 0.5, width: 100, height: 50)
        mybutton.setTitle("Click", for: .normal)
        mybutton.setTitleColor(UIColor.blue, for: .normal)
        view.addSubview(mybutton)
        mybutton.addTarget(self, action: #selector(ViewController.buttonclicked), for: .touchUpInside)
    }
    @objc func buttonclicked(){
        mylabel.text = "Text Label Clicked"
        mybutton.setTitleColor(UIColor.green, for: .normal)
    }


}

