import SwiftUI

struct WelcomeView: View {
    @State var isLoading = false
    
    var body: some View {
        VStack {
            Spacer()
            WHeaderView()
            Spacer()
            if isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
            } else {
                WFooterView()
                    .transition(.moveAndFade)
            }
        }
        .padding(.horizontal, 40.0)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
                withAnimation(.easeInOut(duration: 0.6)) {
                    self.isLoading = false;
                }
            }
        }
    }
}

//MARK: - Header
struct WHeaderView: View {
    let biggerText = Font.system(size: 40.0)
    
    @State private var textAlpha = 0.0
    @State private var textScale: CGFloat = 0.4
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "mappin.and.ellipse")
                .resizable()
                .foregroundColor(Color("MainColor"))
                .frame(width: 80, height: 90)
                .scaledToFit()
            VStack(alignment: .leading, spacing: 10.0) {
                VStack(alignment: .leading, spacing: -5.0) {
                    Text("Welcome to")
                        .font(biggerText)
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                    Text("Journet")
                        .font(biggerText)
                        .fontWeight(.bold)
                        .foregroundColor(Color("MainColor"))
                        .fontDesign(.rounded)
                }
                Text("일기를 통해 사람들과 소통하고 나누는 여행에 진심인 곳.")
            }
        }
        .opacity(textAlpha)
        .scaleEffect(textScale)
        .onAppear {
            withAnimation(.easeInOut(duration: 1)) {
                self.textAlpha = 1.0
                self.textScale = 1.0
            }
        }
    }
}

//MARK: - Footer
struct WFooterView: View {
    @State var showButton = false
    @State private var showIntroductionView: Bool = false
    
    var body: some View {
        VStack {
            VStack(spacing: 20.0) {
                Text("케어+앱은 사용자의 개인정보를 중요하게 생각하고 관리합니다. 아래 버튼을 누름으로써 개인정보 수집에 동의하시는 것으로 보고, 앱 사용시에 수집하는 개인정보에 대해 개발자는 엄격히 관리함을 확인합니다. 광고 추적과 같은 기능적인 수집 데이터는 설정에서 변경 가능합니다.")
                    .multilineTextAlignment(.center)
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Button("개인정보 수집에 관한 내용 확인하기") {
                    //
                }
                .bold()
                .font(.caption)
                .foregroundColor(Color("MainColor"))
            }
            .padding(.horizontal, 10.0)
            
            if showIntroductionView {
                WelcomeView()
                    .fullScreenCover(isPresented: $showIntroductionView, content: {
                        IntroductionView()
                    })
            }
            
            if showButton {
                Button("시작하기", systemImage: "arrow.right") {
                    showIntroductionView = true
                }
                .frame(maxWidth: .infinity)
                .buttonStyle(ButtonPrimaryStyle.init(isLoading: .constant(false)))
                .padding(.vertical, 20.0)
                .transition(.moveAndFade)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation(.easeInOut(duration: 0.6)) {
                    self.showButton = true
                }
            }
        }
    }
}

//MARK: - Custom Transition
extension AnyTransition {
    static var moveAndFade: AnyTransition {
        .asymmetric(
            insertion: .offset(y: 70)
                .combined(with: opacity),
            removal: .scale.combined(with: .opacity)
        )
    }
}

#Preview {
    NavigationView {
        WelcomeView()
    }
}
