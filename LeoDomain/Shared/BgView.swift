import SwiftUI

struct BgView<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        ZStack {
            Color.appRed.ignoresSafeArea()
                content
        }
    }
}
