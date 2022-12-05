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
    
    func getIndex() {
        AF.request(self.baseUrl, method: .get).validate().response { response in
            print("hey got the response")
            switch response.result {
            case .success(let value):
                guard let data = value else { return }
                do {
                    let resp = try JSONDecoder().decode(GetIndexResponse.self, from: data)
                    print(resp)
                } catch let error {
                    print(error)
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}