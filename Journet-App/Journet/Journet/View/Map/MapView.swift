import SwiftUI

struct MapView: View {
    var body: some View {
        VStack(spacing: 0) {
            MHeaderView()
            
            Spacer()
            
            HStack {
                Text("hello, Feed!")
            }
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
