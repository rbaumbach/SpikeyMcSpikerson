import UIKit

class ThirdViewController: UIViewController {
    // if you implement the init() method for the view controller, you must implement the required init method
    // for coder junk
    // I know that I'm not going to be loading this from a storyboard, so lets do nothing
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        self.title = "3rd"
    }
}
