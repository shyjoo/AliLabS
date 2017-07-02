//
//  ViewController.swift
//  Hanson
//
//  Created by Lily Jang on 2017-06-30.
//  Copyright © 2017 Lily Jang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let login = db_Login()
    
    @IBOutlet weak var userIDTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Login(_ sender: UIButton) {
        let providedIdValid = userIDTextField.text
        let providedPassValid = passwordTextField.text
        if providedIdValid == "" {
            displayAlertMessage(messageToDisplay: "Please, input admin id.")
        }
        else if providedPassValid == ""{
            displayAlertMessage(messageToDisplay: "Please, input password.")
        }
        else if providedIdValid != "zxcv"{
            displayAlertMessage(messageToDisplay: "Incorrect Admin id.")
        }
        else{
            let resultLogin = login.loginAdmin(providedIdValid!, providedPassValid!)
            
            if resultLogin.code == 100 {
                //displayAlertMessage(messageToDisplay: "OK!")
                performSegue(withIdentifier: "segueLogin", sender: self)
            }
            else
            {
                displayAlertMessage(messageToDisplay: resultLogin.msg)
            }
        
        }
    }
    
    func displayAlertMessage(messageToDisplay: String){
        let alertController = UIAlertController(title: "Alert", message: messageToDisplay, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (ACTION:UIAlertAction) in
            print("OK....")
        }
        
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }


}

