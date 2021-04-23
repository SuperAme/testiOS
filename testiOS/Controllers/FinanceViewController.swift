//
//  FinanceViewController.swift
//  testiOS
//
//  Created by IDS Comercial on 23/04/21.
//

import Foundation
import UIKit
import CoreData

class FinanceViewController: UIViewController {
    
    @IBOutlet weak var saldoLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    private var model = [Finance]()
    var inCuantity = [Float]()
    var outCuantity = [Float]()
    var inTotal = 0
    var outTotal = 0
    var saldo = 0
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        getFinances()
        for i in model {
            if (i.inOut == true) {
                inCuantity.append(i.cuantity)
            } else {
                outCuantity.append(i.cuantity)
            }
        }
        inTotal = Int(inCuantity.reduce(0, {$0 + $1}))
        outTotal = Int(outCuantity.reduce(0, {$0 + $1}))
        saldo = inTotal - outTotal
        saldoLbl.text = String(saldo)
    }
    func getFinances() {
        do {
            model = try context.fetch(Finance.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch {
            print(error)
        }
    }
}

extension FinanceViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if (model[indexPath.row].inOut == false ) {
            cell.contentView.backgroundColor = #colorLiteral(red: 0.6566328406, green: 0, blue: 0, alpha: 1)
            cell.textLabel?.textColor = .white
        }
        cell.textLabel?.text = "\(model[indexPath.row].descr!) -> \(model[indexPath.row].cuantity)"
        return cell
    }
    
    
}
