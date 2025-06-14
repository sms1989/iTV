import SwiftUI

struct ContentView: View {
    private let modules: [any PlatformModule] = [
        Filimo(),
        FilmNet(),
        StarNet()
    ]

    private let columns = [GridItem(.adaptive(minimum: 360))]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(modules, id: \.id) { module in
                        NavigationLink(destination: destination(for: module)) {
                            VStack {
                                Image(module.logoAssetName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 120)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.black)
                            .cornerRadius(12)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle(Text("platforms.title"))
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
