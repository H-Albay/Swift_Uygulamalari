//
//  ViewController.swift
//  OrderNote
//
//  Created by Hakan Albay on 26.04.2019.
//  Copyright © 2019 Hakan Albay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var deskNoInput: UITextField!
    @IBOutlet weak var ordersInput: UITextField!
    @IBOutlet weak var deskNoLabel: UILabel!
    @IBOutlet weak var ordersText: UITextView!
    @IBOutlet weak var OrdersLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let deskno=UserDefaults.standard.object(forKey: "deskno")
        let orders=UserDefaults.standard.object(forKey: "orders")
        
        if let newdeskno = deskno as? String {
            deskNoLabel.text = "Desk No: \(newdeskno)"
        }
        if let neworders = orders as? String {
            ordersText.text = "Orders: \(neworders)"
        }
    }

    @IBAction func saveClicked(_ sender: Any) {
        deskNoLabel.text = "Masa Numarası: \(deskNoInput.text!)"
        ordersText.text = "Siparişler: \(ordersInput.text!)"
        
        UserDefaults.standard.set(deskNoInput.text!, forKey: "deskno")
        UserDefaults.standard.set(ordersInput.text!, forKey: "orders")
        UserDefaults.standard.synchronize()
        
    }
    
    @IBAction func deleteClicked(_ sender: Any) {
        let deskno=UserDefaults.standard.object(forKey: "deskno")
        let orders=UserDefaults.standard.object(forKey: "orders")
        
        if (deskno as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "deskno")
            UserDefaults.standard.synchronize()
            deskNoLabel.text = "Masa Numarası: "
        }
        if (orders as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "orders")
            UserDefaults.standard.synchronize()
            ordersText.text = "Siparişler: "
        }
    }
}

