import SwiftUI

struct ContentView: View {
    private let modules: [any PlatformModule] = [
        Filimo(),
        FilmNet(),
        StarNet()
    ]

    private let columns = [GridItem(.adaptive(minimum: 180))]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(modules, id: \.id) { module in
                        VStack(spacing: 8) {
                            Image(module.logoAssetName)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 80)
                            Text(LocalizedStringKey(module.nameKey))
                                .font(.title3)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(12)
                    }
                }
                .padding()
            }
            .navigationTitle(Text("platforms.title"))
        }
    }
}

#Preview {
    ContentView()
}
