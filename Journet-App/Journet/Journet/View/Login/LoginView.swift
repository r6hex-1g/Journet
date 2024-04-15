import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack {
            Spacer()
            LHeaderView()
            Spacer()
            LFooterView()
        }
        .padding(.horizontal, 40.0)
    }
}

struct LHeaderView: View {
    var body: some View {
        Image(systemName: "person.badge.key.fill")
            .imageScale(.large)
            .foregroundColor(Color("MainColor"))
        Text("로그인 페이지 예정")
    }
}

struct LFooterView: View {
    
    @State private var showTabbarView: Bool = false
    
    var body: some View {
        if showTabbarView {
            LoginView()
                .fullScreenCover(isPresented: $showTabbarView, content: {
                    TabbarView()
                })
        }
        
        Button("로그인하기", systemImage: "arrow.right") {
            showTabbarView = true
        }
        
        .frame(maxWidth: .infinity)
        .buttonStyle(ButtonPrimaryStyle.init(isLoading: .constant(false)))
        .padding(.vertical, 20.0)
        .transition(.moveAndFade)
    }
}

struct LButtonPrimaryStyle: ButtonStyle {
    @Binding var isLoading: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(isLoading ? Color.accentColor.opacity(0.4) : configuration.isPressed ? Color.accentColor.opacity(1) : Color.accentColor.opacity(0.95))
            .cornerRadius(5)
            .scaleEffect(configuration.isPressed ? 0.99 : 1)
            .animation(.easeOut(duration: 0.1), value: configuration.isPressed)
    }
}

//MARK: - Custom Transition
extension AnyTransition {
    static var LmoveAndFade: AnyTransition {
        .asymmetric(
            insertion: .offset(y: 70)
                .combined(with: opacity),
            removal: .scale.combined(with: .opacity)
        )
    }
}
