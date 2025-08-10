//
//  OnboardingCoordinator.swift
//  FoodDeliveryApp
//
//  Created by .Leeerrrmmm . on 10.08.2025.
//

import UIKit

class HomeCoordinator: Coordinator {
     
    override func start() {
       let vc = ViewController()
        vc.view.backgroundColor = .red
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("AppCoordinator Finish")
    }
}

