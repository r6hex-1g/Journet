import SwiftUI

struct DiariesView: View {
    @State var booking = Booking()
    
    var body: some View {
        
        DHeaderView()
        
        Spacer()
        
        Button("start") {
            booking.onLiveActivity()
        }
        
        Button("stop") {
            booking.offLiveActivity()
        }
        
        Spacer()
    }
}

#Preview {
    ContentView()
}
