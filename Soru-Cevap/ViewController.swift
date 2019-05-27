//
//  ViewController.swift
//  Soru-Cevap
//
//  Created by Hakan Albay on 15.05.2019.
//  Copyright © 2019 Hakan Albay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myimage: UIImageView!
    @IBOutlet weak var myText: UITextView!
    var change = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myimage.isUserInteractionEnabled = true
        let gesterrecognizer = UITapGestureRecognizer(target: self, action: #selector(imageClicked))
        myimage.addGestureRecognizer(gesterrecognizer)
        
    }
    @objc func imageClicked(){
        if change == true {
            myimage.image = UIImage(named: "1-image.jpg")
            myText.text = "İPUCU: M.Ö 350 yılında Kral Mausollos için karısı ve kız kardeşi tarafından Pythea adlı bir mimara yaptırılan mezardır. Bodrum’un o zamanki adıyla Halicarnassus civarında yapılmıştır. 45 metre yüksekliğe, 30 metre genişliğe ve 25 metre uzunluğa sahip olan bu mozolenin tepesinde zaferi simgeleyen dört atlı bir savaş arabası ve arabanın üzerinde de Kral Mausollos ve karısının heykelleri yer almaktaymış. Fakat Haçlı Seferleri sırasında kuşatmacılar tarafından Bodrum Kalesi yapılması için bütün taşları kullanmıştır. Fakat bu ne kadar harika bir yapı olduğunu, hafızalardan ve Dünyanın 7 Harikası listesinden çıkarılamayacağını göstermiştir."
            change = false
        }
        else if change == false{
            myimage.image = UIImage(named: "2-image.jpg")
            myText.text = "Cevap: Artemis Tapınağı (M.Ö. 550 – Efes, Türkiye)"
            change = true
            
        }
        
    }


}

