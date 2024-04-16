import SwiftUI

struct FHeaderView: View {
    var body: some View {
        VStack(spacing: 25) {
            HStack {
                Text("histoire")
                    .fontWeight(.bold)
                
            }
        }
        .padding()
    }
}

#Preview {
    TabbarView()
}
