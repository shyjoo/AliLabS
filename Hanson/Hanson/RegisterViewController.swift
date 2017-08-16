//
//  RegisterViewController.swift
//  Hanson
//
//  Created by ParkPyosang on 2017. 7. 18..
//  Copyright © 2017년 Lily Jang. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var txtFieldFname: UITextField!
    @IBOutlet weak var txtFieldLname: UITextField!
    @IBOutlet weak var txtFieldSnum: UITextField!
    @IBOutlet weak var txtFieldBirth: UITextField!
    @IBOutlet weak var labelMassage: UILabel!
    
    
    @IBAction func btnRegister(_ sender: UIButton) {
        
        let conCustomerDB = db_CustomerRegister()
        
        let resultCustomer = conCustomerDB.customerRegister(txtFieldFname.text!, txtFieldLname.text!, txtFieldSnum.text!, txtFieldBirth.text!)
        if resultCustomer.code == 100 {
            labelMassage.text = "Successful!"
        }
        else{
            labelMassage.text = resultCustomer.msg
        }
    }
        
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

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
