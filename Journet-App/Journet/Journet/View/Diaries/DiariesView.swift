import SwiftUI

struct BookingView: View {
    @State var diaries = Diaries()
    
    var body: some View {
        
        BHeaderView()
        
        Spacer()
        
        Button("start") {
            diaries.onLiveActivity()
        }
        
        Button("stop") {
            diaries.offLiveActivity()
        }
        
        Spacer()
    }
}

#Preview {
    ContentView()
}
