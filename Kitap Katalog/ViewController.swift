

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputText: UITextField!
    var text=""
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
//Prepare segueler arası bilgi aktarımında kullanılır!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ana-kisisel" {
            let destinatVC = segue.destination as! KViewController
            destinatVC.ktext=text
        }
        if segue.identifier == "ana-müh" {
            let destinatVC = segue.destination as! MViewController
            destinatVC.mtext=text
        }
    }
    @IBAction func Kisisel(_ sender: Any) {
        text=inputText.text!
        performSegue(withIdentifier: "ana-kisisel", sender: nil)
    }
    
    @IBAction func Mühendislik(_ sender: Any) {
        text=inputText.text!
        performSegue(withIdentifier: "ana-müh", sender: nil)
    }
    @IBAction func Kayıt(_ sender: Any) {
       //şimdilik boş kalsın..
    }
}

