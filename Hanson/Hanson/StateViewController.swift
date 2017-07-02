//
//  StateViewController.swift
//  Hanson
//
//  Created by Lily Jang on 2017-07-01.
//  Copyright © 2017 Lily Jang. All rights reserved.
//

import UIKit

class StateViewController: UIViewController {
    let conStateDB = db_State()

    @IBOutlet weak var fNameTextField: UITextField!
    @IBOutlet weak var lNameTextField: UITextField!
    @IBOutlet weak var staeLabel: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func State(_ sender: Any) {
        
        let resultState = conStateDB.getState(fNameTextField.text!, lNameTextField.text!)
        
        if resultState.code == 100 {
            staeLabel.text = resultState.state
        }
        else {
            staeLabel.text = resultState.msg
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
