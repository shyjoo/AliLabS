//
//  DailyViewController.swift
//  Hanson
//
//  Created by Lily Jang on 2017-07-12.
//  Copyright © 2017 Lily Jang. All rights reserved.
//

import UIKit

class DailyViewController: UIViewController {
    let conTotalQuery = db_TotalQuery()
    
    var list = [logData]()
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var TotalCountLabel: UILabel!
    @IBOutlet weak var SuccessCountLabel: UILabel!
    @IBOutlet weak var ErrorCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let date = Date()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "MM dd, yyyy"
        let now = formatter.string(from: date)
        DateLabel.text = now + " Query Report"
        
        let result = conTotalQuery.getTotalQuery()
        
        if result.code == 100{
            TotalCountLabel.text = String(result.tcnt)
            SuccessCountLabel.text = String(result.scnt)
            ErrorCountLabel.text = String(result.ecnt)
            
            if result.tcnt == 0 {
                displayAlertMessage(messageToDisplay: "Doesn't have Query Count")
            }
            else{
                
                list = result.list
            }
        }
        else{
            displayAlertMessage(messageToDisplay: result.msg)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logTrace(_ sender: Any) {
        let logTV = storyboard?.instantiateViewController(withIdentifier: "SBLogTrace") as! LogTableViewController
        logTV.LogTraceList = list
        navigationController?.pushViewController(logTV, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func displayAlertMessage(messageToDisplay: String){
        let alertController = UIAlertController(title: "Alert", message: messageToDisplay, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (ACTION:UIAlertAction) in
            print("OK....")
            
        }
        
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
