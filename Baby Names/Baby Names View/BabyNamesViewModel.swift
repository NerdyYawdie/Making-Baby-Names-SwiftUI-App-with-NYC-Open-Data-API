//

import Foundation

class BabyNamesViewModel: ObservableObject {
    
    @Published var babyNames: [BabyName] = []
    
    @Published var showErrorAlert: Bool = false
    @Published var errorMessage: String = ""
    
    @Published var isLoading: Bool = false
    
    let services: APIServices
    
    init(services: APIServices = APIServicesImpl()) {
        self.services = services
    }
    
    @MainActor
    func fetchBabyNames() async {
        
        do {
            isLoading = true
            
            babyNames = try await services.fetchBabyNames()
            
            isLoading = false
        } catch {
            isLoading = false
            
            if let customError = error as? APIServicesError {
                errorMessage = customError.errorMessage
                showErrorAlert.toggle()
            }
        }
    }
}
