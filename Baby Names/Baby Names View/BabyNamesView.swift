//

import SwiftUI

struct BabyNamesView: View {
    
    @StateObject var viewModel: BabyNamesViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                if !viewModel.babyNames.isEmpty {
                    List(viewModel.babyNames) { babyName in
                        RowView(babyName: babyName)
                    }
                } else {
                    ContentUnavailableView(LocalizedStringKey("No Baby Names Found 🥲"), systemImage: "magnifyingglass", description: Text("Please check your internet connection or cellular data. 🍼"))
                }
            }
            .navigationTitle(Text("Baby Names"))
            .task {
                await viewModel.fetchBabyNames()
            }
            .overlay {
                if viewModel.isLoading {
                    ProgressView(LocalizedStringKey("Fetching Names...🐣"))
                }
            }
            .alert(isPresented: $viewModel.showErrorAlert) {
                Alert(title: Text(viewModel.errorMessage))
            }
            .refreshable {
                await viewModel.fetchBabyNames()
            }
        }
    }
}

#Preview {
    BabyNamesView(viewModel: BabyNamesViewModel())
}
