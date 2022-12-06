//
//  ViewController.swift
//  BimAktuelDeneme
//
//  Created by Osman Nuri Yıldız on 5.12.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {    
    
    @IBOutlet weak var aktuelTableView: UITableView!
    @IBOutlet weak var aktuelDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.aktuelTableView.delegate = self
        self.aktuelTableView.dataSource = self
        
        let svc = BimService()
        svc.getAktuel() { resp in
            self.aktuelDateLabel.text = resp.date
            DataStore.aktuelItems = resp.items
            self.aktuelTableView.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataStore.aktuelItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "aktuelTableViewCell", for: indexPath) as! AktuelTableViewCell
        let aktuelItem = DataStore.aktuelItems[indexPath.row]
        
        cell.titleLabel.text = aktuelItem.title
        cell.priceLabel.text = aktuelItem.price
        DispatchQueue.global().async {
            let imageUrl = URL(string: aktuelItem.imageUrl)!
            do {
                let imageData = try Data(contentsOf: imageUrl)
                DispatchQueue.main.async {
                    cell.productImageView.image = UIImage(data: imageData)
                }
            } catch let error {
                print(error)
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }

}
