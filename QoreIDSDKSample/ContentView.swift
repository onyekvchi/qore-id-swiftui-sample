import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Button("Open QoreID") {
                    viewModel.launchQoreID()
                }
                .buttonStyle(.borderedProminent)
            }
            .navigationDestination(isPresented: $viewModel.isQoreIDPresented) {
                QoreIDView(param: viewModel.qoreIDParam) { result in
                    viewModel.handleQoreIDResult(result: result)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
