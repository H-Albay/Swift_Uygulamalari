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
    var elmalar = [UIImageView()]
    var gösterGizle = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let enYuksekPuan = UserDefaults.standard.object(forKey: "EnYuksekPuan")
        if enYuksekPuan == nil{
            EnYuksekPuan.text = "0"
        }
        if let yenienYuksekPuan = enYuksekPuan as? Int{
            EnYuksekPuan.text = String(yenienYuksekPuan)
            
        }
        
        KazanılanPuan.text = "Puan: \(puan)"
        KalanZaman.text = "Kalan Zaman: \(zaman)"
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
        
        gösterGizle = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.saklaElma), userInfo: nil, repeats: true)
        
        elmalar.append(Elma1)
        elmalar.append(Elma2)
        elmalar.append(Elma3)
        elmalar.append(Elma4)
        elmalar.append(Elma5)
        elmalar.append(Elma6)
        
        saklaElma()
        
    }

    @objc func puanarttır(){
    puan = puan + 1
    KazanılanPuan.text = "Puan: \(puan)"
    
    }
    
    @objc func zamanlayıcı () {
        sayac = sayac-1
        KalanZaman.text = "Süre: \(sayac)"
        
        if sayac == 0 {
            zaman.invalidate()
            gösterGizle.invalidate()
            if self.puan > Int(EnYuksekPuan.text!)!{
                UserDefaults.standard.set(self.puan, forKey: "EnYuksekPuan")
                EnYuksekPuan.text = String(self.puan)
            }
            
            let alert = UIAlertController(title: "Oyun bitti!", message: "Süre Doldu !", preferredStyle: .alert)
            let tamamdügme = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil)
            let tekrardügme = UIAlertAction(title: "Tekrar Oyna", style: UIAlertAction.Style.default) { (UIAlertAction) in
                self.puan = 0
                self.KazanılanPuan.text =  "Kazanılan Puan: \(self.puan)"
                
                self.sayac = 55
                self.KalanZaman.text = "Süre: \(self.sayac)"
                
                self.zaman = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.zamanlayıcı), userInfo: nil, repeats: true)
                
                self.gösterGizle = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.saklaElma), userInfo: nil, repeats: true)
            }
            alert.addAction(tekrardügme)
            alert.addAction(tamamdügme)
            self.present(alert,animated: true,completion: nil)
        }
    }
    @objc func saklaElma(){
        for elma in elmalar {
            elma.isHidden=true
        }
        let rasgele = Int (arc4random_uniform(UInt32(elmalar.count - 1)))
        elmalar[rasgele].isHidden = false
    }
}

