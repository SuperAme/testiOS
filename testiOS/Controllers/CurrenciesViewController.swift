//
//  CurrenciesViewController.swift
//  testiOS
//
//  Created by IDS Comercial on 23/04/21.
//

import Foundation
import UIKit

class CurrenciesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var dict = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        getData()
    }
    
    func getData() {
        guard let url = URL(string: Constants.baseURL) else { return }
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            guard let data = data else { return }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                    if let rates = json["rates"] as? [String:Any] {
                        
                        for i in rates {
                            self.dict.append(i.key)
                        }
                        
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}

extension CurrenciesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dict.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dict[indexPath.row]
        return cell
    }
    
    
}
