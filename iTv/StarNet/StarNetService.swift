import Foundation

struct StarNetService {
    struct CatalogResponse: Decodable {
        let data: CatalogData
    }

    struct CatalogData: Decodable {
        let sliders: [Slider]
    }

    struct Slider: Decodable, Identifiable {
        let id = UUID()
        let title: String
        let items: [CatalogItem]
    }

    struct CatalogItem: Decodable, Identifiable {
        let id = UUID()
        let title: String
        let cover: Cover
    }

    struct Cover: Decodable {
        let file: String
    }

    func fetchCatalog() async throws -> [Slider] {
        let url = URL(string: "https://api.starnet.ir/api/V0.0.0/catalog/")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoded = try JSONDecoder().decode(CatalogResponse.self, from: data)
        return decoded.data.sliders
    }
}
