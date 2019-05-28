//
//  ViewController.swift
//  ElmayıYakala
//
//  Created by Hakan Albay on 28.05.2019.
//  Copyright © 2019 Hakan Albay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var KalanZaman: UILabel!
    @IBOutlet weak var KazanılanPuan: UILabel!
    @IBOutlet weak var EnYuksekPuan: UILabel!
    @IBOutlet weak var Elma1: UIImageView!
    @IBOutlet weak var Elma2: UIImageView!
    @IBOutlet weak var Elma3: UIImageView!
    @IBOutlet weak var Elma4: UIImageView!
    @IBOutlet weak var Elma5: UIImageView!
    @IBOutlet weak var Elma6: UIImageView!
    var puan = 0
    var zaman = Timer()
    var sayac = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        KazanılanPuan.text = "Kazanılan Puan: \(puan)"
        KalanZaman.text = "Kalan Zanan: \(zaman)"
        let recognizer1=UITapGestureRecognizer(target: self, action: #selector(ViewController.puanarttır))
        let recognizer2=UITapGestureRecognizer(target: self, action: #selector(ViewController.puanarttır))
        let recognizer3=UITapGestureRecognizer(target: self, action: #selector(ViewController.puanarttır))
        let recognizer4=UITapGestureRecognizer(target: self, action: #selector(ViewController.puanarttır))
        let recognizer5=UITapGestureRecognizer(target: self, action: #selector(ViewController.puanarttır))
        let recognizer6=UITapGestureRecognizer(target: self, action: #selector(ViewController.puanarttır))
        Elma1.isUserInteractionEnabled=true
        Elma2.isUserInteractionEnabled=true
        Elma3.isUserInteractionEnabled=true
        Elma4.isUserInteractionEnabled=true
        Elma5.isUserInteractionEnabled=true
        Elma6.isUserInteractionEnabled=true
        
        Elma1.addGestureRecognizer(recognizer1)
        Elma2.addGestureRecognizer(recognizer2)
        Elma3.addGestureRecognizer(recognizer3)
        Elma4.addGestureRecognizer(recognizer4)
        Elma5.addGestureRecognizer(recognizer5)
        Elma6.addGestureRecognizer(recognizer6)
        
        sayac = 23
        KalanZaman.text = "Kalan Zaman: \(sayac)"
        zaman = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.zamanlayıcı), userInfo: nil, repeats: true)
        
    }

    @objc func puanarttır(){
    puan = puan + 1
    KazanılanPuan.text = "Kazanılan Puan: \(puan)"
    
    }
    
    @objc func zamanlayıcı () {
        sayac = sayac-1
        KalanZaman.text = "Süre: \(sayac)"
        
        if sayac == 0 {
            zaman.invalidate()
            
            let alert = UIAlertController(title: "Oyun bitti!", message: "Süre Doldu !", preferredStyle: .alert)
            let dügme = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(dügme)
            self.present(alert,animated: true,completion: nil)
        }
        
        
    }
}

