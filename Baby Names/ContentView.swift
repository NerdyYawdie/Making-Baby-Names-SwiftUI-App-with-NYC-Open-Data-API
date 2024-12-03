//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            BabyNamesView(viewModel: BabyNamesViewModel())
                .tabItem {
                    VStack {
                        Image(systemName: "person")
                        Text("Baby Names")
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
