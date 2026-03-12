import SwiftUI

@main
struct Safari_Travel_CompanionApp: App {
    var body: some Scene {
        WindowGroup {
            LoadingScreen()
                .preferredColorScheme(.light)
        }
    }
}

#Preview {
    LoadingScreen()
}
