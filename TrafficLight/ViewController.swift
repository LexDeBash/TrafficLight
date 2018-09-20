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
    
    @IBOutlet var redLight: UIView!
    @IBOutlet var yellowLight: UIView!
    @IBOutlet var greenLight: UIView!
    @IBOutlet var startButton: UIButton!
    
    private var currentLight = CurrentLight.off
    
    private let lightIsOn: CGFloat = 1
    private let lightIsOff: CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.layer.cornerRadius = 10
        
        redLight.layer.cornerRadius = redLight.bounds.size.width / 2
        yellowLight.layer.cornerRadius = redLight.bounds.size.width / 2
        greenLight.layer.cornerRadius = redLight.bounds.size.width / 2
        
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

