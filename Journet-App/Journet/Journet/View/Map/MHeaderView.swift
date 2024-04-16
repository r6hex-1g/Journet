import SwiftUI

struct MHeaderView: View {
    var body: some View {
        VStack(spacing: 25) {
            HStack {
                Text("Journet")
                    .fontWeight(.bold)
                
            }
        }
        .padding()
    }
}

#Preview {
    TabbarView()
}
