//
//  DetayVC.swift
//  FilmlerUygulamasi
//
//  Created by İlker Kaya on 2.12.2022.
//

import UIKit

class DetayVC: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var filmName: UILabel!
    
    @IBOutlet weak var tarih: UILabel!
    
    
    @IBOutlet weak var tur: UILabel!
    
    
    @IBOutlet weak var basrol: UILabel!
    
    var film: Filmler?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let f = film{
            imageView.image = UIImage(named: f.film_resim!)
            filmName.text = f.film_ad
            tarih.text = String(f.film_yil!)
            tur.text = f.kategori?.kategori_ad
            basrol.text = f.yonetmen?.yonetmen_ad
            
        }
        // Do any additional setup after loading the view.
    }
    

    

}
