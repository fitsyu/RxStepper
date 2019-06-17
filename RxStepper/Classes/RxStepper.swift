import UIKit

public class RxStepper: UIView {
    
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var valueLabel: UILabel!
    
    private var view: UIView!
    
    private lazy var bundle: Bundle = {
        
        let url = Bundle(for: self.classForCoder).url(forResource: "RxStepper", withExtension: "bundle")
        if url == nil {
            print("failed to load bundle")
        }
        
        let bundle = Bundle(url: url!)
        if bundle == nil {
            print("failed to load bundle")
        }
        
        return bundle!
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        awakeFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override func awakeFromNib() {
        
        print("awake from nib")
        
        let nib = bundle.loadNibNamed("RxStepper", owner: self, options: nil)
        
        view = nib?.first as? UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    public override var intrinsicContentSize: CGSize {
        
        let width: CGFloat = 0.0
            + valueLabel.frame.width
            + 16.0 // space to stepper
            + stepper.frame.width
            + 8.0 // trailing
        
        let height: CGFloat = 0.0
        + 30.0 // title
        + 1.0  // line
        + 8.0 // top
        + 30.0// label + stepper
        + 8.0 // bottom

        size = CGSize(width: width, height: height)
        
        return size
    }
    
}
