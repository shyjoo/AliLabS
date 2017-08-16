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
    var months: [String]!
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
        DailyChart.noDataText = "You need to provide data for the chart."
        var dataEntries: [BarChartDataEntry] = []
        let formato:BarChartFormatter = BarChartFormatter(dataPoints)
        let xaxis:XAxis = XAxis()
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y:values[i], data: dataPoints as AnyObject? )
            dataEntries.append(dataEntry)
            //formato.stringForValue(Double(i), axis: xaxis)
        }
        print(dataEntries)
        var chartDataSet = BarChartDataSet(values: dataEntries, label: "Agency")
        
        chartDataSet.colors = ChartColorTemplates.colorful()
        let chartData = BarChartData(dataSet: chartDataSet)
        DailyChart.data = chartData
        DailyChart.descriptionText = ""
        
//        xaxis.valueFormatter = formato
//        DailyChart.xAxis.valueFormatter = xaxis.valueFormatter
        
        DailyChart.xAxis.valueFormatter = IndexAxisValueFormatter(values:dataPoints)
        //Also, you probably want to add:
        
        DailyChart.xAxis.granularity = 1

        //DailyChart.xAxis.centerAxisLabelsEnabled = true
        DailyChart.xAxis.labelPosition = .bottom
        
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



@objc(BarChartFormatter)
public class BarChartFormatter: NSObject, IAxisValueFormatter
{
    var xLabel = [String]()
    
    public init(_ xLabel : [String]!) {
        self.xLabel = xLabel
    }
    
    public func stringForValue(_ value: Double, axis: AxisBase?) -> String
    {
        return xLabel[Int(value)]
    }   
}


