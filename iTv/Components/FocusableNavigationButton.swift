import SwiftUI

struct FocusableNavigationButton<Content: View>: View {
    let id: UUID
    let onNavigate: (UUID) -> Void
    let content: () -> Content

    @FocusState private var isFocused: Bool

    var body: some View {
        Button {
            onNavigate(id)
        } label: {
            content()
                .scaleEffect(isFocused ? 1.1 : 1.0)
                .animation(.easeInOut(duration: 0.2), value: isFocused)
        }
        .focused($isFocused)
        .buttonStyle(PlainButtonStyle())
    }
}
