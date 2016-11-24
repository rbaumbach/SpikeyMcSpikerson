import UIKit

class ImageSelectorViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    // MARK: - IBOutlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    // MARK: - Constants
    
    let CollectionViewCellIdentifier = "collectionViewCell"
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionViewLayout()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("viewDidAppear:(_:) - Size of view: \(view.bounds.size)")
    }
    
    // MARK - <UICollectionViewDelegateFlowLayout>
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        print("delegate-sizeForItemAt - Size of view: \(view.bounds.size)")
//
//        return view.bounds.size
//    }
    
    // MARK - <UICollectionCollectionViewDataSource>
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIdentifier, for: indexPath)
        
        if indexPath.row % 2 == 0 {
            cell.contentView.backgroundColor = .yellow
        } else {
            cell.contentView.backgroundColor = .green
        }
        
        return cell
    }
    
    // MARK: - Private Methods
    
    private func setupCollectionViewLayout() {
        collectionViewFlowLayout.itemSize = view.bounds.size
    }
}
