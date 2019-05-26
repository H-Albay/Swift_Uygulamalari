import UIKit

func durum (x: Int,y:Int )-> String {
    if x<y {
        return "bizimlesin"
    }
    else{
        return "elendin"
    }
}
durum(x: 4, y: 3)
durum(x: 2, y: 4)
