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

    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        let capactiyStepper = RxStepper()
        capactiyStepper.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(capactiyStepper)
        
        NSLayoutConstraint.activate([
            capactiyStepper.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            capactiyStepper.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
        
    }
}

