//
//  ViewController.swift
//  TrafficLight
//
//  Created by Alexey Efimov on 10.06.2018.
//  Copyright © 2018 Alexey Efimov. All rights reserved.
//

import UIKit

enum CurrentLight {
    case red, yellow, green, off
}

class ViewController: UIViewController {
    
    @IBOutlet weak var redLight: UIView!
    @IBOutlet weak var yellowLight: UIView!
    @IBOutlet weak var greenLight: UIView!
    @IBOutlet weak var startButton: UIButton!
    
    var currentLight = CurrentLight.off
    
    let lightIsOn: CGFloat = 1
    let lightIsOff: CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redLight.layer.cornerRadius = 50
        yellowLight.layer.cornerRadius = 50
        greenLight.layer.cornerRadius = 50
        startButton.layer.cornerRadius = 10
        
        redLight.backgroundColor = UIColor.red.withAlphaComponent(lightIsOff)
        yellowLight.backgroundColor = UIColor.yellow.withAlphaComponent(lightIsOff)
        greenLight.backgroundColor = UIColor.green.withAlphaComponent(lightIsOff)
    }

    @IBAction func startButtonPressed(_ sender: Any) {
        
        startButton.setTitle("NEXT", for: .normal)
        
        switch currentLight {
        case .red:
            redLight.backgroundColor? = UIColor.red.withAlphaComponent(lightIsOff)
            yellowLight.backgroundColor = UIColor.yellow.withAlphaComponent(lightIsOn)
            currentLight = .yellow
        case .yellow:
            yellowLight.backgroundColor = UIColor.yellow.withAlphaComponent(lightIsOff)
            greenLight.backgroundColor = UIColor.green.withAlphaComponent(lightIsOn)
            currentLight = .green
        case .green:
            redLight.backgroundColor = UIColor.red.withAlphaComponent(lightIsOn)
            greenLight.backgroundColor = UIColor.green.withAlphaComponent(lightIsOff)
            currentLight = .red
        case .off:
            redLight.backgroundColor? = UIColor.red.withAlphaComponent(lightIsOn)
            currentLight = .red
        }
    }
    
}

