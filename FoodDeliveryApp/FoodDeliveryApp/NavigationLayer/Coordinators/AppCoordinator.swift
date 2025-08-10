import UIKit

class AppCoordinator: Coordinator {
    
    override func start() {
        showOnboardingFlow()
    }
    
    override func finish() {
        print("AppCoordinator Finish")
    }
}

// MARK: - Навигация
private extension AppCoordinator {
    
    func showOnboardingFlow() {
        guard let navigationController = navigationController else { return }
        
        let onboardingCoordinator = OnboardingCoordinator(
            childCoordinators: [],
            type: .onboarding,
            navigationController: navigationController,
            finishDelegate: self
        )
        
        addChildCoordinator(onboardingCoordinator)
        onboardingCoordinator.start()
    }
    
    func showMainFlow() {
        // Здесь будет MainCoordinator
    }
}

// MARK: - CoordinatorFinishDelegate
extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(coordinator: CoordinatorProtocol) {
        removeChildCoordinator(coordinator)
        
        switch coordinator.type {
        case .app:
            return
        default:
            navigationController?.popToRootViewController(animated: false)
        }
    }
}
