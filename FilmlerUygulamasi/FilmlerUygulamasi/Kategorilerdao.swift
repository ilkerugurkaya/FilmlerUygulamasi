//
//  Kategorilerdao.swift
//  FilmlerUygulamasi
//
//  Created by İlker Kaya on 2.12.2022.
//

import Foundation

class Kategorilerdao{
    let db:FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask,true).first!
        let veriTabani = URL(fileURLWithPath: hedefYol).appendingPathComponent("filmler.sqlite")
        db = FMDatabase(path: veriTabani.path)
    }
    
    func tumKategoriAl() -> [Kategoriler]{
        var liste = [Kategoriler]()
        db?.open()
        do{
            let rs = try db!.executeQuery("SELECT * FROM kategoriler", values: nil)
            while rs.next(){
                let kate = Kategoriler(kategori_id: Int(rs.string(forColumn: "kategori_id")!)!, kategori_ad: rs.string(forColumn: "kategori_ad")!)
                liste.append(kate)
            }
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
        return liste
    }
}
