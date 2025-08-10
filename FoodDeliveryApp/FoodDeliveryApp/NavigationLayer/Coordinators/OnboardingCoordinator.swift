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
       
        let firstVc = OnboardingPartViewController()
        firstVc.titleText = "Delicious Food"
        firstVc.image = UIImage(resource: .leg)
        firstVc.descrionText = "Lorem ipsum dolor sit amet"
        
        let secondVc = OnboardingPartViewController()
        secondVc.titleText = "Fast Shipping"
        secondVc.image = UIImage(resource: .snipped)
        secondVc.descrionText = "Lorem ipsum dolor sit amet"
        
        let thirdVc = OnboardingPartViewController()
        thirdVc.titleText = "Certificate Food"
        thirdVc.image = UIImage(resource: .medal)
        thirdVc.descrionText = "Lorem ipsum dolor sit amet"
        
        let fourthVc = OnboardingPartViewController()
        fourthVc.titleText = "Payment Online"
        fourthVc.image = UIImage(resource: .card)
        fourthVc.descrionText = "Lorem ipsum dolor sit amet"
       
        
        pages.append(firstVc)
        pages.append(secondVc)
        pages.append(thirdVc)
        pages.append(fourthVc)
        
        
        
        let presenter = OnboardingViewPresenter(coordinator: self)
        let viewController = OnboardingViewController(pages: pages, viewOutput: presenter)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

