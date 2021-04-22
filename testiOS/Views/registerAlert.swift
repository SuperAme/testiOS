//
//  registerAlert.swift
//  testiOS
//
//  Created by IDS Comercial on 22/04/21.
//

import Foundation
import UIKit

class registerAlert: UIView {
    
    static let instance = registerAlert()
    var selectedCircleImage = UIImage(systemName: "largecircle.fill.circle") as UIImage?
    var deselectedCircleImage = UIImage(systemName: "circle") as UIImage?
    
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var descrTextField: UITextField!
    @IBOutlet weak var cuantityTextField: UITextField!
    @IBOutlet weak var spendBtn: UIButton!
    @IBOutlet weak var entryBtn: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("registerAlert", owner: self, options: nil)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        alertView.layer.cornerRadius = 10
        
        parentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        parentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    @IBAction func spendingPressed(_ sender: UIButton) {
        setRadioBtnSelected(btn: 1)
    }
    @IBAction func entryPressed(_ sender: UIButton) {
        setRadioBtnSelected(btn: 2)
    }
    @IBAction func addPressed(_ sender: UIButton) {
        parentView.removeFromSuperview()
    }
    
    func setRadioBtnSelected(btn: Int) {
        switch btn {
        case 1:
            spendBtn.setImage(selectedCircleImage, for: .normal)
            entryBtn.setImage(deselectedCircleImage, for: .normal)
        case 2:
            spendBtn.setImage(deselectedCircleImage, for: .normal)
            entryBtn.setImage(selectedCircleImage, for: .normal)
        default:
            spendBtn.setImage(deselectedCircleImage, for: .normal)
            entryBtn.setImage(deselectedCircleImage, for: .normal)
        }
    }
    
    func showAlert() {
        UIApplication.shared.keyWindow?.addSubview(parentView)
    }
    
}
