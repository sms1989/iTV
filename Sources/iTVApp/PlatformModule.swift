import SwiftUI

protocol PlatformModule: Identifiable {
    var name: String { get }
    var logoName: String { get }
    @ViewBuilder func makeHomeView() -> some View
}
