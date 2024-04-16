import SwiftUI

//MARK: - Tab's
enum Tab: String, CaseIterable {
    case Home = "house"
    case Diaries = "applepencil.and.scribble"
    case Notifications = "bell.and.waves.left.and.right"
    case profiles = "person.crop.circle"
    
    var title: String {
           switch self {
           case .Home:
               return "Home"
           case .Diaries:
               return "Diaries"
           case .Notifications:
               return "Notifications"
           case .profiles:
               return "Profiles"
           }
       }
    
    var index: Int {
        return Tab.allCases.firstIndex(of: self) ?? 0
    }
}


//MARK: - Animated SF Tab Model
struct AnimatedTab: Identifiable {
    var id: UUID = .init()
    var tab: Tab
    var isAnimateing: Bool?
}
