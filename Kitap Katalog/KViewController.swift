//
//  KViewController.swift
//  Kitap Katalog
//
//  Created by Hakan Albay on 13.05.2019.
//  Copyright © 2019 Hakan Albay. All rights reserved.
//

import UIKit

class KViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    var ktext = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text=ktext
    }
    



}
