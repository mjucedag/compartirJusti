import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    //Array con el que rellenaremos los labels de las imagenes
    let products = ["barraPan", "croissant", "pastel", "tarta", "bombones", "donut"]
    
    //Array que contiene las imagenes
    let productImages: [UIImage] = [
        
        UIImage(named: "barraPan")!,
        UIImage(named: "croissant")!,
        UIImage(named: "pastel")!,
        UIImage(named: "tarta")!,
        UIImage(named: "bombones")!,
        UIImage(named: "donut")!,
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Esto se puede hacer desde el storyboard, arrastrando el collection al icono del view controller
            //seleccionando delegate y datasource.
//        collectionView.dataSource = self
//        collectionView.delegate = self
        
        //Para ajustar el layout
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5)
        layout.minimumInteritemSpacing = 5
                                                //Es entre dos porque vamos a tener 2 columnas
        layout.itemSize = CGSize(width: (self.collectionView.frame.size.width - 20)/2, height: self.collectionView.frame.size.height/3)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Funcion que se encarga de pintar las celdas, segun el numero de elementos en el array
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //Numero de huecos que va a tener que pintar
        return products.count
    }

    //Funcion que rellena la celda y la muestra
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //Referencia a la celda
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! MyCollectionViewCell
        
        //Asigna el contenido al label de la celda
        cell.productLabel.text = products[indexPath.item]
        //Asigna las imagenes al imageView de la celda
        cell.productImage.image = productImages[indexPath.item]
        //Pone un borde a la celda
        cell.layer.borderColor = UIColor.lightGray.cgColor
        //Le da grosor al borde de la celda
        cell.layer.borderWidth = 0.5
        
        //Pinta la celda ya cargada
        return cell
        
    }
    
    //Cuando se selecciona un item le pone un marco
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.gray.cgColor
        cell?.layer.borderWidth = 2
        
    }
    
    //Cuando se selecciona un item, el item que tenia el foco pierde el marco
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.lightGray.cgColor
        cell?.layer.borderWidth = 0.5
        
    }
    
}

