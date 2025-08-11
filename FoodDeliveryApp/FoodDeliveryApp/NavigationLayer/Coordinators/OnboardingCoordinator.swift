//
//  OnboardingCoordinator.swift
//  FoodDeliveryApp
//
//  Created by .Leeerrrmmm . on 10.08.2025.
//

import UIKit

//MARK: - OnboardingCoordinator
class OnboardingCoordinator: Coordinator {
    
    //MARK: - Properties
    private let factory = SceneFactory.self
     
    
    //MARK: - Methods
    override func start() {
        showOnboarding()
    }
    
    override func finish() {
        print("AppCoordinator Finish")
        finishDelegate?.coordinatorDidFinish(coordinator: self)
    }
}


//MARK: - Navigation
private extension OnboardingCoordinator {
    func showOnboarding() {
        let viewController = factory.makeOnboardingScene(coordinator: self)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

