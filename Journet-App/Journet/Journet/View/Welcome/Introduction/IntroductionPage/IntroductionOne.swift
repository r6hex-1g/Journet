import SwiftUI

struct IntroductionOne: View {
    var body: some View {
        VStack {
            Spacer()
            I1HeaderView()
            Spacer()
        }
         .padding(.horizontal, 40.0)
    }
}

//MARK: - Header Views
struct I1HeaderView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "square.and.pencil")
                .resizable()
                .foregroundColor(Color("MainColor"))
                .frame(width: 60, height: 60)
                .scaledToFit()
            
            VStack(alignment: .leading, spacing: 10.0) {
                VStack(alignment: .leading, spacing: 1) {
                    HStack(spacing: 3) {
                        Text("당신만의 ")
                            .font(.Hanbit37)
                        Text("일기")
                            .font(.Hanbit37)
                            .foregroundStyle(Color("MainColor"))
                        Text("를")
                            .font(.Hanbit37)
                    }
                    Text("세상에 기록하기.")
                        .font(.Hanbit37)
                }
                
                Text("나만의 일기를 써보새요.")
                    .font(.Hanbit20)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("평소와는 다른 공간에서의 일기를 저장하고,")
                        .font(.Hanbit15)
                        .opacity(0.8)
                    Text("그 일기에서 그 날에 대한 감정들을 저잘하고,")
                        .font(.Hanbit15)
                        .opacity(0.8)
                    Text("언제든 필요하다면 꺼내보고 추억을 회상할 수 있도록 도와주기도 하는 공간입니다.")
                        .font(.Hanbit15)
                        .opacity(0.8)
                }
            }
        }
    }
}

#Preview {
    IntroductionOne()
}
