import UIKit

class ThirdViewController: UIViewController {
    // MARK: Init Methods
    
    // if you implement the init() method for the view controller, you must implement the required init method
    // for coder junk
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        title = "3rd"
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        title = "3rd"
    }
}
