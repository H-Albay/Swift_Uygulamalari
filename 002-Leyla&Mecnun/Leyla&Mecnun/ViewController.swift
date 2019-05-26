//
//  ViewController.swift
//  Leyla&Mecnun
//
//  Created by Hakan Albay on 21.04.2019.
//  Copyright © 2019 Hakan Albay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIView!
    @IBOutlet weak var mecnunLabel: UILabel!
    @IBOutlet weak var ismailabiLabel: UILabel!
    @IBOutlet weak var erdalBakkalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        mecnunLabel.isHidden = true
        ismailabiLabel.isHidden = true
        erdalBakkalLabel.isHidden = true
    }

    @IBAction func gosterClick(_ sender: Any) {
        mecnunLabel.isHidden = false
        ismailabiLabel.isHidden = false
        erdalBakkalLabel.isHidden = false
    }
    
}

