
import UIKit

final class ScrollingViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let content: UIViewController
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    init(content: UIViewController) {
        self.content = content
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = UIView()
        scrollView.preservesSuperviewLayoutMargins = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)

        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: scrollView.topAnchor),
            view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
            ])

         /* add child controller and setup constraints */
        add(child: content, in: scrollView)
        content.view.translatesAutoresizingMaskIntoConstraints = false
        content.view.preservesSuperviewLayoutMargins = true

        NSLayoutConstraint.activate([
            content.view.topAnchor.constraint(equalTo: scrollView.topAnchor),
            content.view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            content.view.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            content.view.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            content.view.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            content.view.heightAnchor.constraint(equalToConstant: content.view.frame.height),
            ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = content.title
    }
 
}
