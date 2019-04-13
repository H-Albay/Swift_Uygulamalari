//
//  ViewController.swift
//  ExchangeRateApp
//
//  Created by Hakan Albay on 13.04.2019.
//  Copyright © 2019 Hakan Albay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var TryLabel: UILabel!
    @IBOutlet weak var UsdLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=9ada8d7660e493cbeb9079d49f68a424&format=1")
        let session=URLSession.shared
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                let alert = UIAlertController(title:"Error", message: error?.localizedDescription, preferredStyle:UIAlertController.Style.alert)
                let okButton=UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            }
            else{
                if data != nil {
                    do{
                     let JsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary <String,AnyObject>
                    
                        DispatchQueue.main.async {
                            //print(JsonResult)
                            
                            let rates=JsonResult["rates"] as! [String:AnyObject]
                            //print(rates)
                            let turkish=String(describing: rates["TRY"]!)
                            self.TryLabel.text="TRY: \(turkish)"
                            
                            let usd=String(describing: rates["USD"]!)
                            self.UsdLabel.text="USD: \(usd)"
                        }
                    }
                        catch{
                        
                    }
                }
            }
            
            
        }
        task.resume()
        
    }


}

