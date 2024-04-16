import SwiftUI

//MARK: - Tab's
enum Tab: String, CaseIterable {
    case Map = "map.fill"
    case Diaries = "applepencil.and.scribble"
    case notifications = "bell.and.waves.left.and.right.fill"
    case profiles = "person.crop.circle"
    
    var title: String {
           switch self {
           case .Map:
               return "Map"
           case .Diaries:
               return "Diaries"
           case .notifications:
               return "notifications"
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
