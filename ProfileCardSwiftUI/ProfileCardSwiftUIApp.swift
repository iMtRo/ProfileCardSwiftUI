import SwiftUI

@main
struct ProfileCardSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(profileViewModel())
        }
    }
}
