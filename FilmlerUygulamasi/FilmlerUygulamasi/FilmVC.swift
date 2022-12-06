//
//  FilmVC.swift
//  FilmlerUygulamasi
//
//  Created by İlker Kaya on 2.12.2022.
//

import UIKit

class FilmVC: UIViewController {
    
    
    @IBOutlet weak var filmCollectionView: UICollectionView!
    
    var kategori: Kategoriler?
    
    
    var filmListesi = [Filmler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let k = kategori{
            navigationItem.title = k.kategori_ad
            filmListesi = Filmlerdao().filmlerAl(kategori_id: k.kategori_id!)
        }
        
        filmCollectionView.dataSource = self
        filmCollectionView.delegate = self
        
        let tasarim: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let genislik = self.filmCollectionView.frame.size.width
        
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        let hucreGenislik = (genislik-30)/2
        
        tasarim.itemSize = CGSize(width: hucreGenislik, height: hucreGenislik*1.7)
        
        tasarim.minimumInteritemSpacing = 10
        
        tasarim.minimumLineSpacing = 10
        
        filmCollectionView.collectionViewLayout = tasarim
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as? Int
        
        let gidilecekVC = segue.destination as! DetayVC
        gidilecekVC.film = filmListesi[indeks!]
    }
    
}

extension FilmVC: UICollectionViewDelegate,UICollectionViewDataSource,FilmHucreCellProtocol{
    func sepeteEkle(indexPath: IndexPath) {
        print("Sepete eklenen film : \(filmListesi[indexPath.row].film_ad!)")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmListesi.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let film = filmListesi[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filmHucre", for: indexPath) as! FilmHucreCell
        
        cell.filmName.text = film.film_ad
        cell.fiyatName.text = "14.99 TL"
        cell.imageView.image = UIImage(named: film.film_resim!)
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        
        cell.hucreProtocol = self
        cell.indexPath = indexPath
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetay", sender: indexPath.row)
    }
    
    
}
