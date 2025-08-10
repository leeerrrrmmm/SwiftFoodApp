//
//  OnboardingCoordinator.swift
//  FoodDeliveryApp
//
//  Created by .Leeerrrmmm . on 10.08.2025.
//

import UIKit

class OnboardingCoordinator: Coordinator {
     
    override func start() {
        showOnboarding()
    }
    
    override func finish() {
        print("AppCoordinator Finish")
    }
}

private extension OnboardingCoordinator {
    func showOnboarding() {
        var pages = [UIViewController]()
        let firstVc = UIViewController()
        firstVc.view.backgroundColor = .purple
        let secondVc = UIViewController()
        secondVc.view.backgroundColor = .blue
        let thirdVc = UIViewController()
        thirdVc.view.backgroundColor = .yellow
        let fourthVc = UIViewController()
        fourthVc.view.backgroundColor = .green
        
        pages.append(firstVc)
        pages.append(secondVc)
        pages.append(thirdVc)
        pages.append(fourthVc)
        
        
        
        let presenter = OnboardingViewPresenter(coordinator: self)
        let viewController = OnboardingViewController(pages: pages, viewOutput: presenter)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

