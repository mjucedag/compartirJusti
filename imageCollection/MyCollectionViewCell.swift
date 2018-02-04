import UIKit

//Clase de la celda
class MyCollectionViewCell: UICollectionViewCell {
    //Referencia a los elementos que hay dentro de la celda.
    //Cuando tengamos un objeto de este tipo podremos acceder a estos elementos.
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productLabel: UILabel!
    
}
