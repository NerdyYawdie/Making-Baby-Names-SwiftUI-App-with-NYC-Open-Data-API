//

import SwiftUI

struct RowView: View {
    
    let babyName: BabyName
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Text(babyName.nm)
                    .font(.title2)
                    .bold()
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("Rank: \(babyName.rnk)")
                    Text(babyName.brth_yr)
                }
            }
            
            Text(babyName.gndr.capitalized)
            Text(babyName.ethcty)
                .font(.caption)
        }
    }
}

#Preview {
    RowView(babyName: BabyName(brth_yr: "2022", gndr: "Male", ethcty: "Black", nm: "Nerdy", cnt: "12", rnk: "3"))
        .padding()
}
