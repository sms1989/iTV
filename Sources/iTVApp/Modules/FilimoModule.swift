import SwiftUI

struct FilimoModule: PlatformModule {
    let id = UUID()
    let name = Strings.filimo
    let logoName = "filimo_logo"

    func makeHomeView() -> some View {
        Text(Strings.filimo)
            .font(.largeTitle)
    }
}
