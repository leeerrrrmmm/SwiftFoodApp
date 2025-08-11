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
        finishDelegate?.coordinatorDidFinish(coordinator: self)
    }
}

private extension OnboardingCoordinator {
    func showOnboarding() {
        var pages = [UIViewController]()
       
        let firstVc = OnboardingPartViewController()
        firstVc.titleText = "Delicious Food"
        firstVc.image = UIImage(resource: .leg)
        firstVc.descrionText = "Lorem ipsum dolor sit amet"
        firstVc.buttonText = "Next"
        
        let secondVc = OnboardingPartViewController()
        secondVc.titleText = "Fast Shipping"
        secondVc.image = UIImage(resource: .snipped)
        secondVc.descrionText = "Lorem ipsum dolor sit amet"
        secondVc.buttonText = "Next"

        let thirdVc = OnboardingPartViewController()
        thirdVc.titleText = "Certificate Food"
        thirdVc.image = UIImage(resource: .medal)
        thirdVc.descrionText = "Lorem ipsum dolor sit amet"
        thirdVc.buttonText = "Next"

        
        let fourthVc = OnboardingPartViewController()
        fourthVc.titleText = "Payment Online"
        fourthVc.image = UIImage(resource: .card)
        fourthVc.descrionText = "Lorem ipsum dolor sit amet"
        fourthVc.buttonText = "Sign In"

       
        
        pages.append(firstVc)
        pages.append(secondVc)
        pages.append(thirdVc)
        pages.append(fourthVc)
        
        
        
        let presenter = OnboardingViewPresenter(coordinator: self)
        let viewController = OnboardingViewController(pages: pages, viewOutput: presenter)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

