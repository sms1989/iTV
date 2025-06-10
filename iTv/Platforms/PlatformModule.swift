import SwiftUI

protocol PlatformModule: Identifiable where ID == UUID {
    var id: UUID { get }
    var nameKey: String { get }
    /// Name of the logo image stored in the asset catalog.
    var logoAssetName: String { get }
}

struct AnyPlatformModule: PlatformModule {
    let id = UUID()
    let nameKey: String
    let logoAssetName: String
}
