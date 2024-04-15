import SwiftUI

struct BookingView: View {
    @State var booking = Booking()
    
    var body: some View {
        
        BHeaderView()
        
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
