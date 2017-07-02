
//
//  CreditViewController.swift
//  Hanson
//
//  Created by Lily Jang on 2017-07-01.
//  Copyright © 2017 Lily Jang. All rights reserved.
//

import UIKit

class CreditViewController: UIViewController {

    let conCreditDB = db_Credit()
    
    @IBOutlet weak var fNameField: UITextField!
    @IBOutlet weak var lNameField: UITextField!
    @IBOutlet weak var creditTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func credit(_ sender: Any) {
        
        let resultCredit = conCreditDB.updateCredit(fNameField.text!, lNameField.text!, creditTextField.text!)
        
        if resultCredit.code == 100 {
            resultLabel.text = "Update Complete"
        }
        else{
            resultLabel.text = resultCredit.msg
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
