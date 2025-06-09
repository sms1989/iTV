import SwiftUI

struct FilmnetModule: PlatformModule {
    let id = UUID()
    let name = Strings.filmnet
    let logoName = "filmnet_logo"

    func makeHomeView() -> some View {
        Text(Strings.filmnet)
            .font(.largeTitle)
    }
}
