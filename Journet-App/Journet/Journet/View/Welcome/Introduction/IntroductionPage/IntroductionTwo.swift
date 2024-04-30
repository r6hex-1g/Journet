import SwiftUI

struct IntroductionTwo: View {
    var body: some View {
        VStack {
            Spacer()
            I2HeaderView()
            Spacer()
        }
        .padding(.horizontal, 40.0)
    }
}

//MARK: - Header Views
struct I2HeaderView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "person.line.dotted.person.fill")
                .resizable()
                .foregroundColor(Color("MainColor"))
                .frame(width: 80, height: 40)
                .scaledToFit()
            
            VStack(alignment: .leading, spacing: 10.0) {
                VStack(alignment: .leading, spacing: 1) {
                    Text("일기로 서로를")
                        .font(.Hanbit37)
                    HStack(spacing: 2) {
                        Text("연결")
                            .font(.Hanbit37)
                            .foregroundStyle(Color("MainColor"))
                        Text("하기.")
                            .font(.Hanbit37)
                    }
                }
                
                Text("일기를 통해 타인과 연결되어보세요.")
                    .font(.Hanbit20)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("다른 사람들과 일기를 나누고,")
                        .font(.Hanbit15)
                        .opacity(0.8)
                    Text("자신만의 공간을 나눌 수 있고,")
                        .font(.Hanbit15)
                        .opacity(0.8)
                    Text("서로가 서로의 공간을 확인하면서 알아갈 수 있는 공간입니다.")
                        .font(.Hanbit15)
                        .opacity(0.8)
                }
            }
        }
    }
}

#Preview {
    IntroductionTwo()
}
