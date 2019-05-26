//
//  ViewController.swift
//  OtoTarih
//
//  Created by Hakan Albay on 14.05.2019.
//  Copyright © 2019 Hakan Albay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myimage: UIImageView!
    var count = 0
    
    @IBOutlet weak var mytext: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myimage.image = UIImage(named: "1image.jpg")
        mytext.text="Verbiest tarafından 1672'de çizilen buhar çarklı oyuncağın resmi."
    }

    @IBAction func changeClicked(_ sender: Any) {
        if count == 0 {
            myimage.image = UIImage(named: "2image.jpg")
            mytext.text="Le fardier de Cugnot, 1771 modeli, Paris'te Arts et Métiers Müzesi'nde sergilenmektedir."
            count=count+1
        }
        else if count == 1 {
            myimage.image=UIImage(named: "3image.jpg")
            mytext.text="Serpollet'nin üç tekerlekli aracı"
            count+=1
        }
        else if count == 2 {
            myimage.image = UIImage(named: "1image.jpg")
            mytext.text="Verbiest tarafından 1672'de çizilen buhar çarklı oyuncağın resmi."
            count=count-2
        }
       
        
    }
    
}

