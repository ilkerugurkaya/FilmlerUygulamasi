//
//  FilmHucreCell.swift
//  FilmlerUygulamasi
//
//  Created by İlker Kaya on 2.12.2022.
//

import UIKit


protocol FilmHucreCellProtocol{
    func sepeteEkle(indexPath:IndexPath)
}

class FilmHucreCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var filmName: UILabel!
    
    @IBOutlet weak var fiyatName: UILabel!
    
    var hucreProtocol: FilmHucreCellProtocol?
    var indexPath:IndexPath?
    
    
    @IBAction func sepeteEkle(_ sender: Any) {
        
        hucreProtocol?.sepeteEkle(indexPath: indexPath!)
    }
    
}
