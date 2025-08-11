import UIKit

protocol OnboadringViewOutput: AnyObject {
    func onboardingDidFinish()
}

class OnboardingViewPresenter: OnboadringViewOutput {
    
    private let userStorage = UserStorage.shared
  //MARK: - Properties
    
    weak var coordinator: OnboardingCoordinator!
    
    init(coordinator: OnboardingCoordinator!) {
        self.coordinator = coordinator
    }
    
    
    func onboardingDidFinish() {
        userStorage.passedOnboarding = true
        coordinator.finish()
    }
    
}

 
       
