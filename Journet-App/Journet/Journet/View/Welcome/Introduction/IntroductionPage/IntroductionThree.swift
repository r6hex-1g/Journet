import SwiftUI

struct IntroductionThree: View {
    var body: some View {
        VStack {
            Spacer()
            I3HeaderView()
            Spacer()
        }
        .padding(.horizontal, 40.0)
    }
}

struct I3HeaderView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "person.3.fill")
                .resizable()
                .foregroundColor(Color("MainColor"))
                .frame(width: 80, height: 40)
                .scaledToFit()
            
            VStack(alignment: .leading, spacing: 10.0) {
                VStack(alignment: .leading, spacing: 1) {
                    Text("서로가 일기로")
                        .font(.Hanbit37)
                    HStack(spacing: 2) {
                        Text("소통")
                            .font(.Hanbit37)
                            .foregroundStyle(Color("MainColor"))
                        Text("하는 공간.")
                            .font(.Hanbit37)
                    }
                }
                
                Text("다른 저너분들과 소통해보세요.")
                    .font(.Hanbit20)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("커뮤니티 공간에서 서로 일기를 나누고,")
                        .font(.Hanbit15)
                        .opacity(0.8)
                    Text("저너분들만의 인생 명소를 일기를 통해 구경가고,")
                        .font(.Hanbit15)
                        .opacity(0.8)
                    Text("서로의 의견이나 느낀점을 공유하고 나눌 수 있는 공간입니다.")
                        .font(.Hanbit15)
                        .opacity(0.8)
                }
            }
        }
    }
}

#Preview {
    IntroductionThree()
}

