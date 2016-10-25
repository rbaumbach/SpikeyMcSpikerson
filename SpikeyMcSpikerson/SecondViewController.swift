import UIKit

class SecondViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    // MARK: Constants
    
    let NumberCollectionViewIdentifier = "NumberCollectionViewCell"
    
    // MARK: IBOutlets
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: Private Properties
    
    private let junk: [String] = {
        print("Junk has been setup")
        
        var someJunk: [String] = []
        
        for index in 0...25 {
            someJunk.append(String(index))
        }
        
        return someJunk
    }()
    
    // MARK: Init Methods
    
    // if you implement the init() method for the view controller, you must implement the required init method
    // for coder junk
    // I know that I'm not going to be loading this from a storyboard, so lets do nothing
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        title = "2nd"
    }
    
    // MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
    }
    
    // MARK: <UICollectionViewDataSource>
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return junk.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NumberCollectionViewIdentifier, for: indexPath) as! NumberCollectionViewCell
        cell.numLabel.text = junk[indexPath.row]
        
        return cell
    }
    
    // MARK: Private Methods
    
    private func setupCollectionView() {
        let numberCollectionViewCellNib = UINib(nibName: NumberCollectionViewIdentifier, bundle: nil)
        collectionView.register(numberCollectionViewCellNib, forCellWithReuseIdentifier: NumberCollectionViewIdentifier)
    }
}
