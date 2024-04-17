import SwiftUI

@main
struct JournetApp: App {
    @AppStorage("didLaunchBefore") var didLaunchBefore: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if didLaunchBefore {
                WelcomeView()
            } else {
                TabbarView()
            }
        }
    }
}
