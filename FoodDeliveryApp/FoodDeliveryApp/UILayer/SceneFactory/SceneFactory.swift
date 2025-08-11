//
//  SceneFactory.swift
//  FoodDeliveryApp
//
//  Created by .Leeerrrmmm . on 11.08.2025.
//

import UIKit

struct SceneFactory {
    
    //MARK: - Onboardingflow
    static func makeOnboardingFlow(coordinator: AppCoordinator,finishDelegate: CoordinatorFinishDelegate, navigationController: UINavigationController) {
        let onboardingCoordinator = OnboardingCoordinator(
            childCoordinators: [],
            type: .onboarding,
            navigationController: navigationController,
            finishDelegate: finishDelegate
        )
        
        coordinator.addChildCoordinator(onboardingCoordinator)
        onboardingCoordinator.start()
    }
    
    //MARK: - OnboardingScrene flow
    static func makeOnboardingScene(coordinator: OnboardingCoordinator) -> UIViewController {
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
        
        
        let presenter = OnboardingViewPresenter(coordinator: coordinator)
        let viewController = OnboardingViewController(pages: pages, viewOutput: presenter)
        
        return viewController
    }
    
    
    //MARK: - Main Flow
    static func makeMainFlow(coordinator: AppCoordinator,finishDelegate: CoordinatorFinishDelegate) -> TabBarController {
        
        let homeNavigationController = UINavigationController()
        let homeCoordinator = HomeCoordinator(type: .home, navigationController: homeNavigationController)
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage.init(systemName: "house"), tag: 0)
        homeCoordinator.finishDelegate = finishDelegate
        homeCoordinator.start()
        
        
        let orderNavigationController = UINavigationController()
        orderNavigationController.tabBarItem = UITabBarItem(title: "Order", image: UIImage.init(systemName: "cart"), tag: 1)
        let orderCoordinator = OrderCoordinator(type: .order, navigationController: orderNavigationController)
        orderCoordinator.finishDelegate = finishDelegate
        orderCoordinator.start()
        
        
        let listNavigationController = UINavigationController()
        listNavigationController.tabBarItem = UITabBarItem(title: "List", image: UIImage.init(systemName: "list.bullet"), tag: 2)
        let listCoordinator = ListCoordinator(type: .list, navigationController: listNavigationController)
        listCoordinator.finishDelegate = finishDelegate
        listCoordinator.start()
        
        let profileNavigationController = UINavigationController()
        profileNavigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage.init(systemName: "person.circle"), tag: 3)
        let profileCoordinator = ProfileCoordinator(type: .profile, navigationController: profileNavigationController)
        profileCoordinator.finishDelegate = finishDelegate
        profileCoordinator.start()
        
        
        coordinator.addChildCoordinator(homeCoordinator)
        coordinator.addChildCoordinator(orderCoordinator)
        coordinator.addChildCoordinator(listCoordinator)
        coordinator.addChildCoordinator(profileCoordinator)
        
        
        let tabBarControllers = [homeNavigationController, orderNavigationController, listNavigationController, profileNavigationController]
        
        let tabBarContoller = TabBarController(tabBarControllers: tabBarControllers)
        
        return tabBarContoller
    }
}
