//
//  DailyChartViewController.swift
//  Hanson
//
//  Created by Lily Jang on 2017-07-14.
//  Copyright © 2017 Lily Jang. All rights reserved.
//

import UIKit
import Charts
class DailyChartViewController: UIViewController {
    
    let conAgencyQueryCount = db_AgencyQueryCount()
    var chartX = [String]()
    var chartY = [Double]()
    
    
    @IBOutlet weak var DailyChart: BarChartView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let result = conAgencyQueryCount.getAgencyQueryCount()
        
        if result.code == 100{
            for item in result.list {
                chartX.append(item.name)
                chartY.append(Double(item.count))
            }
            
            setChart(dataPoints: chartX, values: chartY)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "Units Sold")
        let chartData = BarChartData(dataSet: chartDataSet)
            DailyChart.data = chartData
        //DailyChart.xAxis.labelPosition = .bottom
        DailyChart.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .easeInBounce)

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
