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
    
    func getIndex(then: @escaping (GetIndexResponse) -> Void) {
        AF.request(self.baseUrl, method: .get).validate().response { response in
            switch response.result {
            case .success(let value):
                guard let data = value else { return }
                do {
                    let resp = try JSONDecoder().decode(GetIndexResponse.self, from: data)
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
