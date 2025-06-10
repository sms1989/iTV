import SwiftUI

protocol PlatformModule: Identifiable {
    var nameKey: String { get }
    var logoSystemName: String { get }
}

struct AnyPlatformModule: PlatformModule {
    let id = UUID()
    let nameKey: String
    let logoSystemName: String
}
