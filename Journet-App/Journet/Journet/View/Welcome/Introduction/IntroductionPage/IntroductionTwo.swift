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

struct I2HeaderView: View {
    var body: some View {
        Image(systemName: "newspaper.fill")
            .imageScale(.large)
            .foregroundColor(Color("MainColor"))
        Text("소개 내용 들어갈 예정")
    }
}
