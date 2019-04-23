
import UIKit

class ViewController: UIViewController {
    
    private var titleLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = Fonts.title
        label.textColor = Theme.textColor
        label.text = "Weekly Summary"
        return label
    }()
    
    private var descriptionLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = Fonts.caption
        label.textColor = Theme.textColor
        label.text = "Weekly report and data visualization explanation of the progress of our runs, exercise and steps"
        label.sizeToFit()
        return label
    }()
    
    private var graphView:GraphView = {
        let graphView = GraphView()
        graphView.translatesAutoresizingMaskIntoConstraints = false
        return graphView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = Theme.mainColor
        setupHeader()
        setupGraphView()
    }
    
    private func setupHeader(){
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            ])
        
        view.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            descriptionLabel.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            descriptionLabel.widthAnchor.constraint(equalTo: titleLabel.widthAnchor, multiplier: 0.8),
            ])
    }
    
    private func setupGraphView() {
        view.addSubview(graphView)
        NSLayoutConstraint.activate([
            graphView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 32),
            graphView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            graphView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            graphView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.60),
            ])
        
    }
    
}

