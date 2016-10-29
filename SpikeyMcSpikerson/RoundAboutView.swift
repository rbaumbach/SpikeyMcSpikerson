import UIKit

protocol RoundAboutViewDelegate {
    func didTapRoundAboutView(atIndex: Int)
}

class RoundAboutView: UIView, UICollectionViewDataSource, UICollectionViewDelegate {
    // MARK: Constants
    
    let RoundAboutCollectionViewCellIdentifier = "RoundAboutCollectionViewCell"
    
    // MARK: Private Properties
    
    let imageDataSource = ["cube", "frog", "rubix", "squirrel-guy", "steak", "taco", "work"]
    
    // MARK: IBOutlets
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    // MARK: Init Methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
        setupCollectionView()
        
        print("Collection View frame: \(collectionView.frame)")
    }
    
    // MARK: Public Properties
    
    var delegate: RoundAboutViewDelegate?
    
    // MARK: <UICollectionViewDataSouce>
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageDataSource.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RoundAboutCollectionViewCellIdentifier, for: indexPath) as! RoundAboutCollectionViewCell
        
        cell.imageView.image = UIImage(named: imageDataSource[indexPath.row])
        
        return cell
    }
    
    // MARK: <UICollectionViewDelegate>
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("You tapped me! On cell #: \(indexPath.row)")
        
        delegate?.didTapRoundAboutView(atIndex: indexPath.row)
    }
    
    // MARK: Private Methods
    
    private func setupView() {
        let view = loadViewFromNib()
        view.frame = bounds
        
        view.autoresizingMask = [
            UIViewAutoresizing.flexibleWidth,
            UIViewAutoresizing.flexibleHeight
        ]
        
        addSubview(view)
    }
    
    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let roundAboutCollectionViewCellNib = UINib(nibName: RoundAboutCollectionViewCellIdentifier, bundle: nil)
        collectionView.register(roundAboutCollectionViewCellNib, forCellWithReuseIdentifier: RoundAboutCollectionViewCellIdentifier)
    }
}
