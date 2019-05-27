//
//  ViewController.swift
//  Zamanlayıcı
//
//  Created by Hakan Albay on 15.05.2019.
//  Copyright © 2019 Hakan Albay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerText: UILabel!
    var timer = Timer()
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counter = 10
        timerText.text = String(counter)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerMethod), userInfo: nil, repeats: true)
       
    }
    @objc func timerMethod(){
        
        timerText.text = String(counter)
        counter=counter-1
        if counter < 6 {
            timerText.textColor = .yellow
            if counter < 3 {
                timerText.textColor = .red
                if counter == -1 {
                    timer.invalidate()
                    timerText.text = "Süre Doldu.."
                }
            }
           
        }
        
    }


}

