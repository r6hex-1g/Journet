import SwiftUI

struct FeedView: View {
    var body: some View {
        VStack(spacing: 0) {
            FHeaderView()
            
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
