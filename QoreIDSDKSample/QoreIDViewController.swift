import UIKit
import QoreIDSDK

final class QoreIDViewController: UIViewController {
    
    private let param: QoreIDParam
    private let onQoreIDResult: ((QoreIDResult) -> Void)?
    
    init(param: QoreIDParam, completion: ((QoreIDResult) -> Void)? = nil) {
        self.param = param
        self.onQoreIDResult = completion
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable, message: "Initialization from storyboard is not supported.")
    required init?(coder: NSCoder) {
        fatalError("Initialization from storyboard is not supported.")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // launch Qore ID on the main thread
        DispatchQueue.main.async {
            QoreIdSdk.shared.launch(param: self.param, vc: self) { [weak self] result in
                self?.onQoreIDResult?(result)
            }
        }
    }
}
