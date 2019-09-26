//
//  ViewController.swift
//  UIKitAnimation
//
//  Created by Artur Carneiro on 26/09/19.
//  Copyright © 2019 Artur Carneiro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var goBigView: UIView!
    @IBOutlet weak var loadingBarView: UIView!
    @IBOutlet weak var backgroundLoadingBarView: UIView!
    @IBOutlet weak var crescerButton: UIButton!
    @IBOutlet weak var doneLabel: UILabel!
    var labelCenter: CGPoint?
    @IBOutlet weak var loadButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadingBarView.frame.size.width = 0
        doneLabel.alpha = 0
        labelCenter = doneLabel.center
        // Do any additional setup after loading the view.
    }

    @IBAction func goBig(_ sender: UIButton) {
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut, animations: {
            self.goBigView.frame.size.height = 100
            self.goBigView.frame.size.width = 100
            self.goBigView.center.x = self.crescerButton.center.x
        }) { (success: Bool) in
            UIView.animate(withDuration: 0.2) {
                self.goBigView.frame.size.height = 80
                self.goBigView.frame.size.width = 80
                self.goBigView.center.x = self.crescerButton.center.x
            }
        }
    }
    
    @IBAction func loadAnimation(_ sender: UIButton) {
        loadingBarView.frame.size.width = 0
        doneLabel.alpha = 0
        loadButton.alpha = 0
        loadButton.isEnabled = false
        UIView.animate(withDuration: 5, delay: 0, options: .curveLinear, animations: {
            self.loadingBarView.frame.size.width = 200
        }) { (success: Bool) in
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
                self.doneLabel.alpha = 1
                guard let labelCenter = self.labelCenter else { return }
                self.doneLabel.center.y = labelCenter.y - 10
            }) { (success: Bool) in
                UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
                    guard let labelCenter = self.labelCenter else { return }
                    self.doneLabel.center = labelCenter
                }) { (success: Bool) in
                    self.loadButton.alpha = 1
                    self.loadButton.isEnabled = true
                }
                    
            }
        }
    }
}

