import SwiftUI

struct hHeaderView: View {
    @State var text: String = ""
    
    var body: some View {
        headerTextView()
        HStack(alignment: .center, spacing: -25) {
            searchingBar(text: self.$text)
            mapdelegate()
                .padding()
        }
    }
}

//MARK: - TextView
struct headerTextView: View {
    var body: some View {
        
        Spacer(minLength: 20)
        VStack(alignment: .center, spacing: 0) {
            Text("Journet")
                .fontWeight(.bold)
                .fontDesign(.rounded)
        }
    }
}

//MARK: - Bell icon -> Notification View
struct mapdelegate: View {
    var body: some View {
        NavigationLink(destination: NotificationView()) {
            Image(systemName: "bell.fill")
                .resizable()
                .frame(width: 20, height: 23, alignment: .center)
                .foregroundColor(Color("MainColor"))
                .padding()
        }
    }
}

#Preview {
    hHeaderView()
}
