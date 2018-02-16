//
//  AddItemToInventoryViewController.swift
//  LM Inventory
//
//  Created by Zachary Quemore on 2/11/18.
//  Copyright © 2018 Zachary Quemore. All rights reserved.
//

import UIKit

class AddItemToInventoryViewController: UIViewController {
    
    
    @IBOutlet var ItemNameTextField: UITextField!
    
    @IBOutlet var ItemLocationTextField: UITextField!
    
    @IBOutlet var ItemAmountTextField: UITextField!
    
    @IBOutlet var BulkItemSwitch: UISwitch!
    
    @IBOutlet var SaveButtonOutlet: UIButton!
    
    
    @IBAction func QRScanButton(_ sender: Any) {
    }
    
    @IBAction func BulkItemSwitchAction(_ sender: Any) {
        if BulkItemSwitch.isOn != true{
            ItemAmountTextField.isHidden = true
        } else {
            ItemAmountTextField.isHidden = false
        }
    }
    
    
    @IBAction func SaveButton(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    SaveButtonOutlet.layer.cornerRadius = 10
    SaveButtonOutlet.clipsToBounds = true
    ItemAmountTextField.isHidden = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
