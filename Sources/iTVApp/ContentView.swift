import SwiftUI

struct ContentView: View {
    private let modules: [any PlatformModule] = [
        FilimoModule(),
        NamavaModule(),
        FilmnetModule(),
        StarnetModule()
    ]

    var body: some View {
        NavigationStack {
            List(modules, id: \.id) { module in
                NavigationLink(destination: module.makeHomeView()) {
                    HStack {
                        Image(module.logoName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                        Text(module.name)
                            .font(.title2)
                    }
                }
            }
            .navigationTitle(Strings.platformTitle)
        }
    }
}

#Preview {
    ContentView()
}
