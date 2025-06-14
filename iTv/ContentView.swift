import SwiftUI

struct ContentView: View {
    private let modules: [any PlatformModule] = [
        Filimo(),
        FilmNet(),
        StarNet()
    ]

    private let columns = [GridItem(.adaptive(minimum: 360))]
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 32) {
                    ForEach(modules, id: \.id) { module in
                        FocusableNavigationButton(id: module.id) { id in
                            path.append(id)
                        } content: {
                            Image(module.logoAssetName)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 120)
                                .padding()
                                .background(Color.black)
                                .cornerRadius(12)
                        }
                        .padding(8)
                    }
                }
                .padding()
            }
            .navigationTitle(Text("platforms.title"))
            .navigationDestination(for: UUID.self) { id in
                if let module = modules.first(where: { $0.id == id }) {
                    destination(for: module)
                } else {
                    Text("platforms.title")
                }
            }
        }
    }

    @ViewBuilder
    private func destination(for module: any PlatformModule) -> some View {
        if module is StarNet {
            StarNetHomeView()
        } else if module is FilmNet {
            FilmNetHomeView()
        } else {
            Text(NSLocalizedString(module.nameKey, comment: ""))
        }
    }
}

#Preview {
    ContentView()
}
