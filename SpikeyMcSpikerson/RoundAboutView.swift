import UIKit

// This entire view is a bad idea, it really should be a View Controller.  We shouldn't have a view be a delegate to one it's subviews.  This breaks
// the MVC pattern.

protocol RoundAboutViewDelegate {
    func didTapRoundAboutView(atIndex: Int)
}

class RoundAboutView: UIView, UICollectionViewDataSource, UICollectionViewDelegate {
    // MARK: Constants
    
    let RoundAboutCollectionViewCellIdentifier = "RoundAboutCollectionViewCell"
    
    // MARK: IBOutlets
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    @IBOutlet private weak var pageControl: UIPageControl!
    
    // MARK: Private Properties
    
    let imageDataSource = ["cube", "frog", "rubix", "squirrel-guy", "steak", "taco", "work"]
    
    // MARK: Init Methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        startMeUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        startMeUp()
    }
    
    // MARK: UIView
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // This is bad, use UICollectionViewDelegateFlowLayout instead =(
        
        let totalSize = CGSize(width: self.bounds.size.width, height: self.bounds.size.height)
        
        collectionViewFlowLayout.itemSize = totalSize
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
    
    // MARK: <UIScrollViewDelegate>
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("Scroll view did end decelerating")
        
        print("center of collection view: \(collectionView.center)")

        let centerPoint = CGPoint(x: collectionView.frame.size.width / 2 + scrollView.contentOffset.x, y: collectionView.frame.size.height / 2 + scrollView.contentOffset.y);
        print("center Points!!!: \(centerPoint)")
        
        let shownCellIndexPath = collectionView.indexPathForItem(at: centerPoint)

        print("IndexPath of center of collection view: \(shownCellIndexPath!))")
        
        pageControl.currentPage = shownCellIndexPath!.row
    }
    
    // MARK: Private Methods
    
    private func startMeUp() {
        setupView()
        setupCollectionView()
        setupPageControl()
    }
    
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
    
    private func setupPageControl() {
        pageControl.numberOfPages = imageDataSource.count
        pageControl.pageIndicatorTintColor = .yellow
        pageControl.currentPageIndicatorTintColor = .black
    }
}
