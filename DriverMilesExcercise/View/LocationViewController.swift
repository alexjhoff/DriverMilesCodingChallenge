//
//  LocationViewController.swift
//  DriverMilesExcercise
//
//  Created by Alex Hoff on 4/10/18.
//  Copyright © 2018 Alex Hoff. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController {

    var viewModel = LocationViewModel()
    
    @IBOutlet weak var latLabel: UILabel!
    @IBOutlet weak var longLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.delegate = self
    }
}

extension LocationViewController: LocationDelegate {
    func updateLocation(lat: String, long: String) {
        latLabel.text = "Lat: " + lat
        longLabel.text = "Long: " + long
    }
}
