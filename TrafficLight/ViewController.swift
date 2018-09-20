//
//  ViewController.swift
//  TrafficLight
//
//  Created by Alexey Efimov on 10.06.2018.
//  Copyright © 2018 Alexey Efimov. All rights reserved.
//

import UIKit

enum CurrentLight {
    case off, red, yellow, green
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
        
        redLight.alpha = lightIsOff
        yellowLight.alpha = lightIsOff
        greenLight.alpha = lightIsOff
    }

    @IBAction func startButtonPressed(_ sender: Any) {
        
        startButton.setTitle("NEXT", for: .normal)
        
        switch currentLight {
            
        case .off:
            redLight.alpha = lightIsOn
            currentLight = .red
        case .red:
            redLight.alpha = lightIsOff
            yellowLight.alpha = lightIsOn
            currentLight = .yellow
        case .yellow:
            yellowLight.alpha = lightIsOff
            greenLight.alpha = lightIsOn
            currentLight = .green
        case .green:
            redLight.alpha = lightIsOn
            greenLight.alpha = lightIsOff
            currentLight = .red
        }
    }
    
}

