//
//  BimService.swift
//  BimAktuelDeneme
//
//  Created by Osman Nuri Yıldız on 5.12.2022.
//

import Foundation
import Alamofire

class BimService {
    let baseUrl = "https://kolektifapi.kekikakademi.org/bim"
    
    func getAktuel(then: @escaping (GetAktuelResponse) -> Void) {
        AF.request(self.baseUrl, method: .get).validate().response { response in
            switch response.result {
            case .success(let value):
                guard let data = value else { return }
                do {
                    var resp = try JSONDecoder().decode(GetAktuelResponse.self, from: data)
                    
                    // Fix faulty data coming from the API
                    for i in 0..<resp.items.count {
                        resp.items[i].imageUrl = resp.items[i].imageUrl.replacingOccurrences(of: "//bim.com.tr", with: "//www.bim.com.tr")
                        resp.items[i].url = resp.items[i].url.replacingOccurrences(of: "//bim.com.tr", with: "//www.bim.com.tr")
                    }
                    
                    then(resp)
                } catch let error {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
