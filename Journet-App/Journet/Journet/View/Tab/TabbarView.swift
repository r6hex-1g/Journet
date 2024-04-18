import SwiftUI
import Lottie

struct TabbarView: View {
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    //MARK: - View Properties
    
    @State var currentTab: Tab = .home
    @State var animatedIcons: [AnimatedIcons] = {
        var tabs: [AnimatedIcons] = []
        for tab in Tab.allCases {
            tabs.append(.init(tabIcon: tab, lottieView: LottieAnimationView(name: tab.rawValue, bundle: .main)))
        }
        return tabs
    }()
    
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $currentTab) {
                HomeView()
                    .tag(Tab.home)
                
                DiariesView()
                    .tag(Tab.diaries)
                
                NotificationView()
                    .tag(Tab.notifications)
                
                ProfileView()
                    .tag(Tab.profiles)
            }
            
            //MARK: - iOS 16 Update code
            if #available(iOS 16, *) {
                Tabbar()
                    .toolbar(.hidden, for: .tabBar)
            } else {
                Tabbar()
            }
        }
    }
    
    //MARK: - Tabbar Design
    @ViewBuilder
    func Tabbar() -> some View {
        HStack(spacing: 0) {
            ForEach(animatedIcons) { icon in
                let tabColor: SwiftUI.Color = currentTab == icon.tabIcon ? (scheme == .dark ? Color("DarkMainColor") : Color("MainColor")) : .gray.opacity(0.6)
                
                VStack(spacing: -5) {
                    ResizableLottieView(lottieView: icon.lottieView, color: tabColor)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 50)
                    
                    Text(icon.tabIcon.title)
                        .font(.caption)
                        .foregroundColor(currentTab == icon.tabIcon ? Color("MainColor") : .gray.opacity(0.6))
                }
                
                    .frame(maxWidth: .infinity)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        // MARK: - Updating Current Tab & Playing Animation
                        currentTab = icon.tabIcon
                        icon.lottieView.play { _ in
                            //
                        }
                    }
                
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(.bar)
    }
}


//MARK: - setup to BackGround
extension View {
    @ViewBuilder
    func setBG() -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                Color.primary
                    .opacity(0.05)
                    .ignoresSafeArea()
            }
    }
}

//MARK: - title mod.
extension Tab {
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .diaries:
            return "Diaries"
        case .notifications:
            return "Notifications"
        case .profiles:
            return "Profiles"
        }
    }
}

#Preview {
    TabbarView()
}
