import SwiftUI

struct NamavaModule: PlatformModule {
    let id = UUID()
    let name = Strings.namava
    let logoName = "namava_logo"

    func makeHomeView() -> some View {
        Text(Strings.namava)
            .font(.largeTitle)
    }
}
