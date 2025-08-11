import UIKit

//MARK: - OnboardingPartViewController
class OnboardingPartViewController: UIViewController {
    
    //MARK: - Properties
    var image: UIImage? {
        didSet{
            imageView.image = image
        }
    }
    
    var titleText: String? = "" {
        didSet {
            titleLabel.text = titleText
        }
    }
    
    var descrionText: String? {
        didSet {
            descriptionLabel.text = descrionText
        }
    }
    
    var buttonText: String?
    
    // MARK: - Views
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
}

// MARK: - Layout
private extension OnboardingPartViewController {
    func setupLayout() {
        setupView()
        setupImageView()
        setupTitleLabel()
        setupDescription()
    }
    
    func setupView() {
        view.backgroundColor = AppColors.accentOrange
    }
    
    func setupImageView() {
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func setupTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .Roboto.bold.size(24)
        titleLabel.textColor = AppColors.white
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    func setupDescription() {
        view.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = .Roboto.regular.size(17)
        descriptionLabel.textColor = AppColors.white
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}
