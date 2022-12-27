import Foundation
import Combine
class NetworkingManager {
    enum NetworkingError : LocalizedError {
        case badURLReponse(url : URL)
        case unknown
        var errorDescription: String? {
            switch self{
            case .badURLReponse(url: let url) : return "Bad response from URL.\(url)"
            case .unknown : return "Unknown error occured"
            }
        }
    }
    static func download(url: URL) -> AnyPublisher<Data,Error> {
     return URLSession.shared.dataTaskPublisher(for: url)
//             .subscribe(on: DispatchQueue.global(qos:.default)) -->> IT's already did background we don't need this code.
             .tryMap({ try handleURLResponse(output: $0, url: url)})
             .retry(3) // if it downloading problem, provides me try again 3 times
             .eraseToAnyPublisher()
    }
   static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkingError.badURLReponse(url: url)
        }
        return output.data
    }
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}
