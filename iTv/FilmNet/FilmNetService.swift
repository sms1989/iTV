import Foundation

struct FilmNetService {
    struct Response: Decodable {
        let data: [Widget]
    }

    /// Some responses wrap the widgets under `data.widgets`.
    struct NestedResponse: Decodable {
        let data: DataContainer

        struct DataContainer: Decodable {
            let widgets: [Widget]
        }
    }

    /// And others use a `widgets` key directly at the top level.
    struct WidgetsResponse: Decodable {
        let widgets: [Widget]
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
        let decoder = JSONDecoder()

        // 1. Standard `{ "data": [ ... ] }` format.
        if let response = try? decoder.decode(Response.self, from: data) {
            return response.data
        }

        // 2. Nested `{ "data": { "widgets": [ ... ] } }` variant.
        if let nested = try? decoder.decode(NestedResponse.self, from: data) {
            return nested.data.widgets
        }

        // 3. Direct `{ "widgets": [ ... ] }` container.
        if let container = try? decoder.decode(WidgetsResponse.self, from: data) {
            return container.widgets
        }

        // 4. Raw array at the top level.
        return try decoder.decode([Widget].self, from: data)
    }
}
