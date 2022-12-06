//
//  ViewController.swift
//  FilmlerUygulamasi
//
//  Created by İlker Kaya on 2.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var kategoriTableView: UITableView!
    
    var kategori = [Kategoriler]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        veritabaniKopyala()
        
        kategoriTableView.delegate = self
        kategoriTableView.dataSource = self
        
        kategori = Kategorilerdao().tumKategoriAl()
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as? Int
        
        let gidilecekVC = segue.destination as! FilmVC
        gidilecekVC.kategori = kategori[indeks!]
    }
    func veritabaniKopyala(){
        let bundleYolu = Bundle.main.path(forResource: "filmler", ofType: ".sqlite")
        
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask,true).first!
        
        let fileManager = FileManager.default
        
        let kopyanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("filmler.sqlite")
        
        if fileManager.fileExists(atPath: kopyanacakYer.path){
            print("Veritabanı zaten var kopyalamaya gerek yok")
        }else{
            do{
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyanacakYer.path)
            }catch{
                print(error)
            }
        }
        
    }


}

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kategori.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let kate = kategori[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "kategoriHucre", for: indexPath) as! KategoriHucreCell
        
        cell.labelKategoriAd.text = kate.kategori_ad
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toFilm", sender: indexPath.row)
    }
}
