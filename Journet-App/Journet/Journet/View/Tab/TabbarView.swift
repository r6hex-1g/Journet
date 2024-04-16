import SwiftUI

struct TabbarView: View {
    //MARK: - View Properties
    @State private var activeTab: Tab = .Map
    
    //MARK: - All Tab's
    @State private var allTabs: [AnimatedTab] = Tab.allCases.compactMap { tab -> AnimatedTab? in
        return .init(tab: tab)
    }
    
    //MARK: - Bounce Property
    @State private var bouncesDown: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $activeTab) {
                
                //MARK: - Feed views
                NavigationStack {
                    MapView()
                }
                .setUpTab(.Map)
                
                //MARK: - Booking views
                NavigationStack {
                    BookingView()
                }
                .setUpTab(.Diaries)
                
                //MARK: - Chat views
                NavigationStack {
                    ChatView()
                }
                .setUpTab(.Notifications)
                
                //MARK: - profiles views
                NavigationStack {
                    ProfileView()
                }
                .setUpTab(.profiles)
            }
            CustomTabBar()
        }
    }
    
    //MARK: - Custom Tab Bar
    func CustomTabBar() -> some View {
        HStack(spacing: 0) {
            ForEach($allTabs) { $animatedTab in
                let tab = animatedTab.tab
                
                VStack(spacing: 4) {
                    Image(systemName: tab.rawValue)
                        .font(.title2)
                        .symbolEffect(.bounce.up.byLayer, value: animatedTab.isAnimateing)
                    
                    Text(tab.title)
                        .font(.caption2)
                        .textScale(.secondary)
                }
                
                .frame(maxWidth: .infinity)
                .foregroundStyle(activeTab == tab ? Color("MainColor") : Color.gray.opacity(0.8))
                .padding(.top, 15)
                .padding(.bottom, 10)
                .contentShape(.rect)
                
                //MARK: - use Button
                .onTapGesture {
                    withAnimation(.bouncy, completionCriteria: .logicallyComplete, {
                        activeTab = tab
                        animatedTab.isAnimateing = true
                    }, completion: {
                        var trasnaction = Transaction()
                        trasnaction.disablesAnimations = true
                        withTransaction(trasnaction) {
                            animatedTab.isAnimateing = nil
                        }
                    })
                    
                }
            }
        }
        .background(.bar)
    }
}

#Preview {
    ContentView()
}

extension View {
    @ViewBuilder
    func setUpTab(_ tab: Tab) -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .tag(tab)
            .toolbar(.hidden, for: .tabBar)
    }
}
