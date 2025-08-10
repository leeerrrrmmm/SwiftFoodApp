import UIKit

protocol OnboadringViewOutput: AnyObject {
    func onboardingDidFinish()
}

class OnboardingViewPresenter: OnboadringViewOutput {
  //MARK: - Properties
    
    weak var coordinator: OnboardingCoordinator!
    
    init(coordinator: OnboardingCoordinator!) {
        self.coordinator = coordinator
    }
    
    
    func onboardingDidFinish() {
        coordinator.finish()
    }
    
}

 
       
