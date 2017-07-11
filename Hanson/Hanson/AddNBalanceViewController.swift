//
//  AddNBalanceViewController.swift
//  Hanson
//
//  Created by Lily Jang on 2017-07-05.
//  Copyright © 2017 Lily Jang. All rights reserved.
//

import UIKit

class AddNBalanceViewController: UIViewController {
    let conAddNBalDB = db_AddressNBalance()
    
    @IBOutlet weak var fNameTextField: UITextField!
    @IBOutlet weak var lNameTextField: UITextField!
    @IBOutlet weak var addTextField: UITextField!
    @IBOutlet weak var balTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func AddNBal(_ sender: Any) {
        let result = conAddNBalDB.updateAddNBal(fNameTextField.text!, lNameTextField.text!, addTextField.text!, balTextField.text!)
        if result.code == 100 {
            resultLabel.text = "Update Complete"
        }
        else
        {
            resultLabel.text = result.msg
        }
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
