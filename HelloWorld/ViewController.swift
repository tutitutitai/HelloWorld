//
//  ViewController.swift
//  HelloWorld
//
//  Created by Вячеслав Дроздов on 17.04.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet var redLight: UIView!
    @IBOutlet var yellowLight: UIView!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var greenLight: UIView!
    
    var currentLight: TrafficLight = .red
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redLight.layer.cornerRadius = redLight.frame.height / 2
        yellowLight.layer.cornerRadius = yellowLight.frame.height / 2
        greenLight.layer.cornerRadius = greenLight.frame.height / 2
        
        updateTrafficLight()
    }
    
    @IBAction func nextButtonTapped() {
        currentLight = currentLight.next()
        updateTrafficLight()
    }
    
    func updateTrafficLight() {
        switch currentLight {
        case .red:
            redLight.alpha = 1.0
            yellowLight.alpha = 0.45
            greenLight.alpha = 0.45
        case .yellow:
            redLight.alpha = 0.45
            yellowLight.alpha = 1.0
            greenLight.alpha = 0.45
        case .green:
            redLight.alpha = 0.45
            yellowLight.alpha = 0.45
            greenLight.alpha = 1.0
        }
    }
    
    enum TrafficLight {
        case red
        case yellow
        case green
        
        func next() -> TrafficLight {
            switch self {
            case .red:
                return .yellow
            case .yellow:
                return .green
            case .green:
                return .red
            }
        }
    }
}

