import SwiftUI
import QoreIDSDK

struct QoreIDView: UIViewControllerRepresentable {
    
    var param: QoreIDParam
    var completion: (QoreIDResult) -> Void

    func makeUIViewController(context: Context) -> QoreIDViewController {
        let viewController = QoreIDViewController(param: param, completion: completion)
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: QoreIDViewController, context: Context) {
        // do nothing on update
    }
}
