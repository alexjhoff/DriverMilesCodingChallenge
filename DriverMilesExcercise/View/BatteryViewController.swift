//
//  BatteryViewController.swift
//  DriverMilesExcercise
//
//  Created by Alex Hoff on 4/10/18.
//  Copyright © 2018 Alex Hoff. All rights reserved.
//

import UIKit
import Charts

class BatteryViewController: UIViewController {
    
    let surveyData = ["Overhead": 78.8, "CPU": 0.4, "Network": 13.4, "Location": 7.2]
    
    let pieChart: PieChartView = {
        let p = PieChartView()
        p.translatesAutoresizingMaskIntoConstraints = false
        p.noDataText = "No data to display"
        return p
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupPieChart()
        fillChart()
    }

    func setupPieChart() {
        view.addSubview(pieChart)
        pieChart.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        pieChart.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        pieChart.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        pieChart.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        pieChart.chartDescription?.text = "Average Component Utilization"
    }
    
    func fillChart() {
        var dataEntries = [PieChartDataEntry]()
        for (key, val) in surveyData {
            let entry = PieChartDataEntry(value: Double(val), label: key)
            dataEntries.append(entry)
        }
        
        let chartDataSet = PieChartDataSet(values: dataEntries, label: "Data taken from energy impact meter after 20min of use")
        chartDataSet.colors = ChartColorTemplates.colorful()
        chartDataSet.sliceSpace = 2
        chartDataSet.selectionShift = 5
        
        let chartData = PieChartData(dataSet: chartDataSet)
        pieChart.data = chartData
    }
}
