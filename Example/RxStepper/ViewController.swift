//
//  ViewController.swift
//  RxStepper
//
//  Created by fitsyu on 06/17/2019.
//  Copyright (c) 2019 fitsyu. All rights reserved.
//

import UIKit
import RxStepper

class ViewController: UIViewController {
    
    var aRxStepper: RxStepper?

    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        let capactiyStepper = RxStepper()
        
        // config
        capactiyStepper.title = "Kapasitas Kamar"
        capactiyStepper.startValue = 1
        capactiyStepper.endValue   = 4
        
        capactiyStepper.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(capactiyStepper)
        
        NSLayoutConstraint.activate([
            capactiyStepper.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            capactiyStepper.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
        
        self.aRxStepper = capactiyStepper
    }
    
    @IBAction func buttonPress(_ sender: UIButton) {
        
        let message = " The value is \(aRxStepper?.value()) "
        
        let alert = UIAlertController(title: "Info", message: message,
                                      preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
        
    }
}

