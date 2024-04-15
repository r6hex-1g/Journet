import SwiftUI

struct IntroductionView: View {
    var body: some View {
        VStack {
            IHeader()
            IButton()
                .padding(.horizontal, 40.0)
        }
    }
}

struct IHeader: View {
    var body: some View {
        TabView {
            IntroductionOne()
                .padding()
                .tabItem {
                    Image(systemName: "circle.fill")
                }
            
            IntroductionTwo()
                .padding()
                .tabItem {
                    Image(systemName: "circle.fill")
                }
            
            IntroductionThree()
                .padding()
                .tabItem {
                    Image(systemName: "circle.fill")
                }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .interactive))
    }
}

struct IButton: View {
    @State var showButton = false
    @State private var showLoginPage: Bool = false
    
    var body: some View {
        VStack {
            if showLoginPage {
                IntroductionView()
                    .fullScreenCover(isPresented: $showLoginPage, content: {
                        LoginView()
                    })
            }
            
            if showButton {
                Button("케어하러 가기", systemImage: "arrow.right") {
                    showLoginPage = true
                }
                .frame(maxWidth: .infinity)
                .buttonStyle(ButtonPrimaryStyle.init(isLoading: .constant(false)))
                .padding(.vertical, 20.0)
                .transition(.moveAndFade)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    showButton = true
                }
            }
        }
    }
}
