//
//  ProdViewController.swift
//  Hanson
//
//  Created by Lily Jang on 2017-07-01.
//  Copyright © 2017 Lily Jang. All rights reserved.
//

import UIKit

class ProdViewController: UIViewController {
    let conProdDB = db_Prod_Purchased()
    
    @IBOutlet weak var fNameTextField: UITextField!
    @IBOutlet weak var lNameTextField: UITextField!
    @IBOutlet weak var ProdTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Prod(_ sender: Any) {
        let result = conProdDB.updateProdPurchased(fNameTextField.text!, lNameTextField.text!, ProdTextField.text!)
        
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
