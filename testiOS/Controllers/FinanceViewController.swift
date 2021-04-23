//
//  FinanceViewController.swift
//  testiOS
//
//  Created by IDS Comercial on 23/04/21.
//

import Foundation
import UIKit

class FinanceViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var myArray = ["dde","effr","tyyt"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
}

extension FinanceViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = myArray[indexPath.row]
        return cell
    }
    
    
}
