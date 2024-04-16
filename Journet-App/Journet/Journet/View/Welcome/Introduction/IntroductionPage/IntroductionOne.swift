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

struct I1HeaderView: View {
    let biggerText = Font.system(size: 35.0)
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "person.line.dotted.person.fill")
                .resizable()
                .foregroundColor(Color("MainColor"))
                .frame(width: 80, height: 40)
                .scaledToFit()
            
            VStack(alignment: .leading, spacing: 10.0) {
                VStack(alignment: .leading, spacing: -5.0) {
                    Text("Connect to")
                        .font(biggerText)
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                    Text("Journey")
                        .font(biggerText)
                        .fontWeight(.bold)
                        .foregroundStyle(Color("MainColor"))
                        .fontDesign(.rounded)
                }
                
                Text("일기를 통해 타인과 연결되어보세요.")
                Text("다른 사람들과 다른 모습으로 일기를 나누고, 자신만의 공간을 나누며 이런 곳이 있음을 나눌 수 있습니다.")
                    .font(.caption)
            }
        }
    }
}
