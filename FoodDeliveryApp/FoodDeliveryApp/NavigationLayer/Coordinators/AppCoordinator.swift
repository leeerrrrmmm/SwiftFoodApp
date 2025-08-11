import UIKit

class AppCoordinator: Coordinator {
    //MARK: - Properies
    private let userStorage = UserStorage.shared
    private let factory = SceneFactory.self
    
    override func start() {
        //MARK: - как вариант для сброса флага показа основного екрана(вместо этого показать Onboarding ( полезно если пользователь нажал на кнопку: Выйти из аккаунта
    //userStorage.passedOnboarding = false
    //или
    //UserDefaults.standart.removeObject(forKey: в нашем случае'passedOnboarding')
        showOnboardingFlow()
//        if(userStorage.passedOnboarding){
//            showMainFlow()
//        }else{
//            showOnboardingFlow()
//        }
       
        
    }
    
    override func finish() {
        print("AppCoordinator Finish")
    }
}

// MARK: - Навигация
private extension AppCoordinator {
    
    func showOnboardingFlow() {
        guard let navigationController = navigationController else { return }
        factory.makeOnboardingFlow(coordinator: self, finishDelegate: self, navigationController: navigationController)

    }
    
    func showMainFlow() {
        // Здесь будет MainCoordinator
        guard let navigationController = navigationController else { return }
        
        let tabBarContoller = factory.makeMainFlow(coordinator:self,finishDelegate: self)
        
        navigationController.pushViewController(tabBarContoller, animated: true)
        
    }
}

// MARK: - CoordinatorFinishDelegate
extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(coordinator: CoordinatorProtocol) {
        removeChildCoordinator(coordinator)
        
        switch coordinator.type {
        case .onboarding:
            navigationController?.viewControllers.removeAll()
            showMainFlow()
        case .app:
            return
        default:
            navigationController?.popToRootViewController(animated: false)
        }
    }
}
