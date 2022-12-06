//
//  AktuelItem.swift
//  BimAktuelDeneme
//
//  Created by Osman Nuri Yıldız on 5.12.2022.
//

import Foundation

struct AktuelItem: Codable {
    var title: String
    var url: String
    var imageUrl: String
    var price: String
    
    enum CodingKeys: String, CodingKey {
        case title = "urun_baslik"
        case url = "urun_link"
        case imageUrl = "urun_gorsel"
        case price = "urun_fiyat"
    }
}
