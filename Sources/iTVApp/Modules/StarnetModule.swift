import SwiftUI

struct StarnetModule: PlatformModule {
    let id = UUID()
    let name = Strings.starnet
    let logoName = "starnet_logo"

    func makeHomeView() -> some View {
        Text(Strings.starnet)
            .font(.largeTitle)
    }
}
