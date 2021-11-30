import Foundation

private actor JokeServiceStore {
    private var loadedJoke = Joke(value: "")
    
    func load() async throws -> Joke {
        let (data, response) = try await URLSession.shared.data(from: URL(string:"https://api.chucknorris.io/jokes/random")!)
        guard
            let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode == 200
        else {
            throw DownloadError.statusNotOk
        }
        guard let decodedResponse = try? JSONDecoder().decode(Joke.self, from: data)
        else { throw DownloadError.decoderError }
        loadedJoke = decodedResponse
        // Joke(value: decodedResponse.value)
        return loadedJoke
    }
}

class JokeService: ObservableObject {
    @Published private(set) var joke = "Joke appears here"
    @Published private(set) var isFetching = false
    private let store = JokeServiceStore()
    
    public init() { }
}

enum DownloadError: Error {
    case statusNotOk
    case decoderError
}

extension JokeService {
    @MainActor
    func fetchJoke() async throws {
        isFetching = true
        defer { isFetching = false }
        
        let loadedJoke = try await store.load()
        joke = loadedJoke.value
    }
}

struct Joke: Codable {
    let value: String
}
