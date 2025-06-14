import SwiftUI

struct FilmNetHomeView: View {
    @State private var widgets: [FilmNetService.Widget] = []

    var body: some View {
        List {
            ForEach(widgets) { widget in
                Section(header: Text(widget.display_title)) {
                    ScrollView(.horizontal) {
                        HStack(spacing: 12) {
                            ForEach(widget.configuration.items) { item in
                                if let url = URL(string: item.video_content.cover_image.path) {
                                    NavigationLink(destination: Text(item.video_content.title)) {
                                        AsyncImage(url: url) { image in
                                            image
                                                .resizable()
                                                .scaledToFill()
                                        } placeholder: {
                                            Color.gray
                                        }
                                        .frame(width: 300, height: 170)
                                        .clipped()
                                        .cornerRadius(8)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle(Text("filmnet.name"))
        .task {
            await load()
        }
    }

    func load() async {
        do {
            widgets = try await FilmNetService().fetchHomePage()
        } catch {
            print("Failed to fetch home page: \(error)")
        }
    }
}

#Preview {
    FilmNetHomeView()
}
