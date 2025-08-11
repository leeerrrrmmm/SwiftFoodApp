import UIKit

// MARK: - OnboardingViewController
class OnboardingViewController: UIViewController {
    
    // MARK: - Properties
    private var pages: [UIViewController]
    
    // MARK: - Views
    private let pageViewController: UIPageViewController
    private let pageControl = UIPageControl()
    private let bottomButton = UIButton()
    
     var viewOutput: OnboadringViewOutput!
    
    // MARK: - Init
    init(pages: [UIViewController], viewOutput: OnboadringViewOutput) {
        self.pages = pages
        self.viewOutput = viewOutput
        self.pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal
        )
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupPageViewController()
        setupPageControl()
        setupButton()
        
        // Обязательно обновляем кнопку и pageControl для первого экрана сразу
        updateButtonTitle(for: 0)
        pageControl.currentPage = 0
    }
}

//MARK: - Actions
private extension OnboardingViewController {
    @objc func buttonPressed() {
        let nextIndex = pageControl.currentPage + 1
        
        if nextIndex < pages.count {
            pageControl.currentPage = nextIndex
            pageViewController.setViewControllers([pages[nextIndex]], direction: .forward, animated: true, completion: nil)
            updateButtonTitle(for: nextIndex)
        } else {
            print("Exit or finish onboarding")
            viewOutput?.onboardingDidFinish() 
        }
    }
    
    func updateButtonTitle(for index: Int) {
        if let page = pages[index] as? OnboardingPartViewController {
            bottomButton.setTitle(page.buttonText, for: .normal)
        }
    }
}

// MARK: - Layout
private extension OnboardingViewController {
    func setupPageViewController() {
        pageViewController.delegate = self
        pageViewController.dataSource = self
        
        if let firstPage = pages.first {
            pageViewController.setViewControllers(
                [firstPage],
                direction: .forward,
                animated: true
            )
        }
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pageViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            pageViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        pageViewController.didMove(toParent: self)
    }
    
    func setupPageControl() {
        pageControl.numberOfPages = pages.count
        pageControl.isUserInteractionEnabled = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -45)
        ])
    }
    
    func setupButton() {
        view.addSubview(bottomButton)
        
        bottomButton.translatesAutoresizingMaskIntoConstraints = false
        bottomButton.backgroundColor = AppColors.lightGrey
        bottomButton.titleLabel?.font = .Roboto.bold.size(18)
        bottomButton.setTitleColor(AppColors.black, for: .normal)
        bottomButton.layer.cornerRadius = 20
        bottomButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)  // ОБЯЗАТЕЛЬНО
        
        NSLayoutConstraint.activate([
            bottomButton.bottomAnchor.constraint(equalTo: pageControl.topAnchor, constant: -20),
            bottomButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            bottomButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            bottomButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

// MARK: - UIPageViewControllerDataSource
extension OnboardingViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController), currentIndex > 0 else {
            return nil
        }
        return pages[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController), currentIndex < pages.count - 1 else {
            return nil
        }
        return pages[currentIndex + 1]
    }
}

// MARK: - UIPageViewControllerDelegate
extension OnboardingViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        if completed, let visibleVC = pageViewController.viewControllers?.first,
           let index = pages.firstIndex(of: visibleVC) {
            pageControl.currentPage = index
            updateButtonTitle(for: index)
        }
    }
    
}
