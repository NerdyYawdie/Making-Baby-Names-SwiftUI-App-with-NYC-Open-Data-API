//

import Foundation

struct BabyName: Decodable, Identifiable {
    let id = UUID()
    let brth_yr: String
    let gndr: String
    let ethcty: String
    let nm: String
    let cnt: String
    let rnk: String
}
