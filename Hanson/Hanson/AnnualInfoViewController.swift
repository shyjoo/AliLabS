//
//  AnnualInfoViewController.swift
//  Hanson
//
//  Created by Lily Jang on 2017-07-05.
//  Copyright © 2017 Lily Jang. All rights reserved.
//

import UIKit

class AnnualInfoViewController: UIViewController {
    let conAnnualDB = db_AnnualInfo()
    
    @IBOutlet weak var YearTextField: UITextField!
    @IBOutlet weak var PurchaseTextField: UITextField!
    @IBOutlet weak var UserCountTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func AnnualInfo(_ sender: Any) {
        let result = conAnnualDB.updateAnnualInfo(YearTextField.text!, PurchaseTextField.text!, UserCountTextField.text!)
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
