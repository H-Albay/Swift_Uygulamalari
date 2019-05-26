//
//  ViewController.swift
//  HesapMakinesi
//
//  Created by Hakan Albay on 22.04.2019.
//  Copyright © 2019 Hakan Albay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var s1Text: UITextField!
    @IBOutlet weak var s2Text: UITextField!
    @IBOutlet weak var sonucText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        sonucText.text = ""
       
    }

    @IBAction func toplaClick(_ sender: Any) {
        if let hesap1 = Int(s1Text.text!) {
            if let hesap2 = Int(s2Text.text!) {
                let sonuc = hesap1  + hesap2
                sonucText.text = String(sonuc)
            }
        }
    }
    
    @IBAction func cıkarClick(_ sender: Any) {
        
        if let hesap1 = Int(s1Text.text!){
            if let hesap2 = Int(s2Text.text!){
                let sonuc = hesap1 - hesap2
                sonucText.text = String(sonuc)
                
            }
        }
    }
    @IBAction func carpClick(_ sender: Any) {
        if let hesap1 = Int(s1Text.text!){
            if let hesap2 = Int(s2Text.text!){
                let sonuc = hesap1 * hesap2
                sonucText.text = String(sonuc)
            }
        }
    }
    @IBAction func bolClick(_ sender: Any) {
        if let hesap1 = Int(s1Text.text!){
            if let hesap2 = Int(s2Text.text!){
                let sonuc = hesap1 / hesap2
                sonucText.text = String(sonuc)
                
            }
        }
    }
}

