//
//  GetAktuelResponse.swift
//  BimAktuelDeneme
//
//  Created by Osman Nuri Yıldız on 5.12.2022.
//

import Foundation

struct GetAktuelResponse: Codable {
    var source: String
    var date: String
    var items: [AktuelItem]
    
    enum CodingKeys: String, CodingKey {
        case source = "kaynak"
        case date = "tarih"
        case items = "veri"
    }
}
