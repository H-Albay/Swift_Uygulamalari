
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
    }

    @IBAction func redClicked(_ sender: Any) {
        view.backgroundColor = UIColor.red
    }
    
    @IBAction func whiteClicked(_ sender: Any) {
        view.backgroundColor = UIColor.white
    }
  
    @IBAction func purpleClicked(_ sender: Any) {
        view.backgroundColor = UIColor.purple
    }
}

