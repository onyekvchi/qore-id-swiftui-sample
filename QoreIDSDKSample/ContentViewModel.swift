import SwiftUI
import QoreIDSDK

final class ContentViewModel: ObservableObject {
    
    @Published var isQoreIDPresented: Bool
    @Published var qoreIDParam: QoreIDParam
    
    init() {
        let applicant = ApplicantData(
            firstname: "Jane",
            lastname:"Doe",
            phone: "+2348012345678")
        
        self.qoreIDParam = QoreIDParam()
            .clientId(clientId: "[your-client-id]")
            .customerReference("[customer-reference]")
            .inputData(InputData(applicant: applicant))
            .collection("liveness")
            .build()
        
        self.isQoreIDPresented = false
    }
    
    func launchQoreID() {
        isQoreIDPresented = true
    }
    
    func handleQoreIDResult(result: QoreIDResult?) {
        isQoreIDPresented = false
        
        if let errorResult = result as? ErrorResult {
            // handle this error however you want
            print("error from sdk: \(errorResult.message)")
        } else if let successResult = result as? SuccessResult {
            // handle this error however you want
            if let message = successResult.message {
                print("success from sdk: \(message)")
            }
        } else {
            // unknown error from QoreID
        }
    }
}
