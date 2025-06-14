import Foundation

struct FilmNetService {
    struct Response: Decodable {
        let data: [Widget]
    }

    struct Widget: Decodable, Identifiable {
        let id = UUID()
        let configuration: Configuration
        let display_title: String
    }

    struct Configuration: Decodable {
        let items: [Item]
    }

    struct Item: Decodable, Identifiable {
        let id = UUID()
        let video_content: VideoContent
    }

    struct VideoContent: Decodable {
        let title: String
        let cover_image: Image
    }

    struct Image: Decodable {
        let path: String
    }

    func fetchHomePage() async throws -> [Widget] {
        let url = URL(string: "https://api-v2.filmnet.ir/widgets/personal-home-page")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoded = try JSONDecoder().decode(Response.self, from: data)
        return decoded.data
    }
}
