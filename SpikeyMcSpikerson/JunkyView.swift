import UIKit

@IBDesignable class JunkyView: UIView {
    // MARK: IBOutlets
    
    @IBOutlet private weak var textView: UITextView!
    
    // MARK: Init Methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    // MARK: UIView
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        printTextToTextArea(text: "awakeFromNib() frame: \(self.frame)")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        printTextToTextArea(text: "layoutSubviews() frame: \(self.frame)")
    }
    
    // MARK: Private Methods
    
    private func setupView() {
        let view = loadViewFromNib()

        view.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(view)
        
        // use layout anchors instead
        
        let visualFormatViewsDict = ["view": view]
        
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|",
                                                                   options: [],
                                                                   metrics: nil,
                                                                   views: visualFormatViewsDict)
        
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|",
                                                                 options: [],
                                                                 metrics: nil,
                                                                 views: visualFormatViewsDict)
        self.addConstraints(horizontalConstraints)
        self.addConstraints(verticalConstraints)
        
        printTextToTextArea(text: "setupView() frame: \(self.frame)")
    }
    
    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    private func printTextToTextArea(text: String) {
        textView.text = textView.text + text + "\n"
    }
}
