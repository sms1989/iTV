import SwiftUI

struct ContentView: View {
    private let modules: [any PlatformModule] = [
        Filimo(),
        Namava(),
        FilmNet(),
        StarNet()
    ]

    var body: some View {
        NavigationStack {
            List(modules, id: \.id) { module in
                HStack(spacing: 16) {
                    Image(systemName: module.logoSystemName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 64, height: 64)
                    Text(LocalizedStringKey(module.nameKey))
                        .font(.title3)
                }
            }
            .navigationTitle(Text("platforms.title"))
        }
    }
}

#Preview {
    ContentView()
}
