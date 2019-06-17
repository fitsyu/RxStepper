import UIKit
import RxSwift
import RxCocoa

private class RxStepperViewModel {
    
    var value : BehaviorRelay<Int> = BehaviorRelay(value: 0)
}

public class RxStepper: UIView {
    
    public var title: String?  = "" { didSet { titleLabel.text = title }}
    public var startValue: Int = 0  { didSet { stepper.minimumValue = Double(startValue) }}
    public var endValue: Int   = 0  { didSet { stepper.maximumValue = Double(endValue) }}
    public func value() -> Int { return viewModel.value.value }

    
    private var viewModel = RxStepperViewModel()
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var titleLabel: UILabel!
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
        let nib = bundle.loadNibNamed("View", owner: self, options: nil)
        
        view = nib?.first as? UIView
        view.frame = self.bounds
        self.addSubview(view)
        
        setupReactivity()
    }
    
    public override var intrinsicContentSize: CGSize {
        
        let width: CGFloat = 0.0
            + valueLabel.frame.width
            + 16.0 // space to stepper
            + stepper.frame.width
            + 16.0 // trailing
        
        let height: CGFloat = 0.0
        + 30.0 // title
        + 1.0  // line
        + 8.0 // top
        + 30.0// label + stepper
        + 8.0 // bottom

        let size = CGSize(width: width, height: height)
        
        return size
    }
    
    // MARK: Reactivity
    private func setupReactivity() {
        
        viewModel.value
            .asObservable()
            .subscribe(onNext: { [unowned self]  newValue in
                self.valueLabel.text = "\(newValue)"
            })
            .disposed(by: self.disposeBag)
    }
}


extension RxStepper {
    
    @IBAction func stepper(_ sender: UIStepper) {
        viewModel.value.accept( Int(sender.value) )
    }
}
