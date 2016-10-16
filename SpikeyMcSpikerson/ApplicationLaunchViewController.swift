import UIKit

//  This class has a xib file that has the same exact UI as the Launch Screen storyboard.
//  This way when the app launches it will display the same UI when it transitions to the
//  ApplicationLaunchViewController which then can be used to handle any start up work without
//  polluting the AppDelegate.  I'm going to add a "loading circle" to this in case there are any
//  items in here that take a long time to complete.

protocol ApplicationLaunchViewControllerDelegate: class {
    func applicationLaunchViewControllerDidFinish()
}

class ApplicationLaunchViewController: UIViewController {
    // MARK: Public Properties
    
    weak var delegate:ApplicationLaunchViewControllerDelegate?
    
    // MARK: View Lifecycle
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        handleApplicationLaunchItems()
        
        // once the view appears, we can assume that everything is setup and we can let our delegate know about this,
        // in this case the AppDelegate
        delegate?.applicationLaunchViewControllerDidFinish()
    }
    
    // MARK: Private Methods
    
    func handleApplicationLaunchItems() {
        // handle all your work items here instead of app delegate
        // ex: setup Crashlytics, analytics, 3rd party tools, data migrations
        // or anything that takes an extended amount of time that you need to be handled
        // before the application starts up
    }
}
