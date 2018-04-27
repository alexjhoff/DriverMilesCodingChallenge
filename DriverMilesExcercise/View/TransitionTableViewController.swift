//
//  TransitionTableViewController.swift
//  DriverMilesExcercise
//
//  Created by Alex Hoff on 4/11/18.
//  Copyright © 2018 Alex Hoff. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class TransitionTableViewController: UIViewController {

    var isSwiped = false
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel1: UILabel!
    @IBOutlet weak var detailLabel2: UILabel!
    @IBOutlet weak var detailLabel3: UILabel!
    @IBOutlet weak var detailLabel4: UILabel!
    @IBOutlet weak var detailLabel5: UILabel!
    @IBOutlet weak var infoLabel1: UILabel!
    @IBOutlet weak var infoLabel2: UILabel!
    @IBOutlet weak var button1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoLabel1.alpha = 0
        infoLabel2.alpha = 0
        button1.alpha = 0
        
        button1.layer.cornerRadius = 5
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handleGesture))
        self.view.addGestureRecognizer(panGesture)
        
    }

    
    @objc func handleGesture(_ recognizer: UIPanGestureRecognizer) {
        
        let offset = recognizer.translation(in: view).y
        
        let gestureIsDraggingDown = (offset > 0)
        
        if gestureIsDraggingDown {
            let timingFunction = CAMediaTimingFunction(controlPoints: 5/6, 0.2, 1/6, 0.8)
            
            CATransaction.begin()
            CATransaction.setAnimationTimingFunction(timingFunction)
            
            UIView.animate(withDuration: 0.8) {
                self.titleLabel.frame.origin.y = 250
                self.detailLabel1.frame.origin.y = 400
                self.detailLabel2.frame.origin.y = 600
                self.detailLabel3.frame.origin.y = 800
                self.detailLabel4.frame.origin.y = 1000
                self.detailLabel5.frame.origin.y = 1200
                
                self.detailLabel1.alpha = 0
                self.detailLabel2.alpha = 0
                self.detailLabel3.alpha = 0
                self.detailLabel4.alpha = 0
                self.detailLabel5.alpha = 0

                self.infoLabel1.alpha = 1
                self.infoLabel2.alpha = 1
                self.button1.alpha = 1
            }
            
            CATransaction.commit()
            
        } else {
            let timingFunction = CAMediaTimingFunction(controlPoints: 1/6, 0.8, 2/6, 1)
            
            CATransaction.begin()
            CATransaction.setAnimationTimingFunction(timingFunction)
            
            UIView.animate(withDuration: 0.8) {
                self.titleLabel.frame.origin.y = 80
                
                self.detailLabel1.frame.origin.y = 150
                self.detailLabel2.frame.origin.y = 225
                self.detailLabel3.frame.origin.y = 300
                self.detailLabel4.frame.origin.y = 375
                self.detailLabel5.frame.origin.y = 450
                
                self.detailLabel1.alpha = 1
                self.detailLabel2.alpha = 1
                self.detailLabel3.alpha = 1
                self.detailLabel4.alpha = 1
                self.detailLabel5.alpha = 1
                
                self.infoLabel1.alpha = 0
                self.infoLabel2.alpha = 0
                self.button1.alpha = 0
            }
            
            CATransaction.commit()
        }
    }
}
