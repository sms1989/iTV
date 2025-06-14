import SwiftUI

struct StarNetHomeView: View {
    @State private var sliders: [StarNetService.Slider] = []

    var body: some View {
        List {
            ForEach(sliders) { slider in
                Section(header: Text(slider.title)) {
                    ScrollView(.horizontal) {
                        HStack(spacing: 12) {
                            ForEach(slider.items) { item in
                                if let url = URL(string: item.cover.file) {
                                    AsyncImage(url: url) { image in
                                        image
                                            .resizable()
                                            .scaledToFill()
                                    } placeholder: {
                                        Color.gray
                                    }
                                    .frame(width: 200, height: 120)
                                    .clipped()
                                    .cornerRadius(8)
                                }
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle(Text("starnet.name"))
        .task {
            await load()
        }
    }

    func load() async {
        do {
            sliders = try await StarNetService().fetchCatalog()
        } catch {
            print("Failed to fetch catalog: \(error)")
        }
    }
}

#Preview {
    StarNetHomeView()
}
