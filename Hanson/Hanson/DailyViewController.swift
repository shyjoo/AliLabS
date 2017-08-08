//
//  DailyViewController.swift
//  Hanson
//
//  Created by Lily Jang on 2017-07-12.
//  Copyright © 2017 Lily Jang. All rights reserved.
//

import UIKit
import Charts

class DailyViewController: UIViewController {
    let conTotalQuery = db_TotalQuery()
    var piex = [String]()
    var piey = [Double]()
    
    @IBOutlet weak var queryCntView: PieChartView!
    
    var list = [logData]()
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var TotalCountLabel: UILabel!
    @IBOutlet weak var SuccessCountLabel: UILabel!
    @IBOutlet weak var ErrorCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let date = Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        let now = dateFormatter.string(from: date)
        DateLabel.text = now + " Query Report"
        
        
        let result = conTotalQuery.getTotalQuery()
        
        if result.code == 100 && result.tcnt != 0 {
            
            TotalCountLabel.text = String(result.tcnt)
            SuccessCountLabel.text = String(result.scnt)
            ErrorCountLabel.text = String(result.ecnt)
            
            //chart set
            piex.append("Success")
            piex.append("Error")
            piey.append(Double(result.scnt))
            piey.append(Double(result.ecnt))
            
            setChart(dataPoints: piex, values: piey)
            
            list = result.list!
        }
        else if result.code == 0 {
            TotalCountLabel.text = "0"
            SuccessCountLabel.text = "0"
            ErrorCountLabel.text = "0"
            displayAlertMessage(messageToDisplay: "Doesn't have Query Count")
            
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
    
    func setChart(dataPoints: [String], values: [Double]) {
        queryCntView.noDataText = "You need to provide data for the chart."
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(x: values[i], y: values[i])
            dataEntries.append(dataEntry)
        }
        
        let pieChartDataSet = PieChartDataSet(values: dataEntries, label: "Query Count")
        let pieChartData = PieChartData(dataSet: pieChartDataSet)//(xVals: dataPoints, dataSet: pieChartDataSet)
        
        
        queryCntView.data = pieChartData
        queryCntView.descriptionText = ""
        var colors: [UIColor] = []
        
        for i in 0..<dataPoints.count {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
        }
        
        pieChartDataSet.colors = colors
        
        
    }
}
