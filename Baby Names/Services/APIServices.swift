//

import Foundation

protocol APIServices {
    func fetchBabyNames() async throws -> [BabyName]
}

enum APIServicesError: Error {
    case invalidURL
    case invalidResponse
    case custom(String)
    
    var errorMessage: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid Response"
        case .custom(let error):
            return "Something went wrong: \(error)"
        }
    }
}

class APIServicesImpl: APIServices {
    
    private let endpoint: String = "https://data.cityofnewyork.us/resource/25th-nujf.json"
    
    func fetchBabyNames() async throws -> [BabyName] {
        
        guard let url = URL(string: endpoint) else {
            throw APIServicesError.invalidURL
        }
        
        var urlRequest = URLRequest(url: url)
        
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard let httpURLResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpURLResponse.statusCode)    else {
                throw APIServicesError.invalidResponse
            }
            
            do {
                let babyNames = try JSONDecoder().decode([BabyName].self, from: data)
                return babyNames
            } catch {
                throw APIServicesError.custom(error.localizedDescription)
            }

        } catch {
            throw APIServicesError.custom(error.localizedDescription)
        }
    }
}
