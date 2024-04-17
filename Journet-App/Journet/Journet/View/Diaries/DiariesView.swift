import SwiftUI

struct DiariesView: View {
    @State var diaries = Diaries()
    
    var body: some View {
        DHeaderView()
        Spacer()
        VStack {
            Button("start") {
                diaries.onLiveActivity()
            }
            
            Button("stop") {
                diaries.offLiveActivity()
            }
        }
        Spacer()
    }
}

#Preview {
    DiariesView()
}
