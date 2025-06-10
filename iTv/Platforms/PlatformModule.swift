import SwiftUI

protocol PlatformModule: Identifiable where ID == UUID {
    var id: UUID { get }
    var nameKey: String { get }
    /// Name of the SF Symbol used as a placeholder logo.
    var logoSystemName: String { get }
}

struct AnyPlatformModule: PlatformModule {
    let id = UUID()
    let nameKey: String
    let logoSystemName: String
}
