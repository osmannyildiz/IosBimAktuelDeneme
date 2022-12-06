//
//  ViewController.swift
//  BimAktuelDeneme
//
//  Created by Osman Nuri Yıldız on 5.12.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tvAktuel: UITableView!
    @IBOutlet weak var lblAktuelDate: UILabel!
    var aktuelItems: [AktuelItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.tvAktuel.register(UITableViewCell.self, forCellReuseIdentifier: "tvcAktuel")
        self.tvAktuel.delegate = self
        self.tvAktuel.dataSource = self
        
        let svc = BimService()
        svc.getIndex() { resp in
            self.lblAktuelDate.text = resp.date
            self.aktuelItems = resp.items
            self.tvAktuel.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tvcAktuel", for: indexPath) as! TvcAktuel
        cell.lblTitle.text = aktuelItems[indexPath.row].title
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.aktuelItems.count
//        return 5
    }

}

