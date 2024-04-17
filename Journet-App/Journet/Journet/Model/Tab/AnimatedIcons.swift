import SwiftUI
import Lottie

//MARK: - Animated Icons Models
struct AnimatedIcons: Identifiable {
    var id: String = UUID().uuidString
    var tabIcon: Tab
    var lottieView: LottieAnimationView
}
