import SwiftUI

//MARK: - ButtonStyle set
struct ButtonPrimaryStyle: ButtonStyle {
    @Binding var isLoading: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(isLoading ? Color("MainColor").opacity(0.4) : configuration.isPressed ? Color("MainColor").opacity(1) : Color("MainColor").opacity(0.95))
            .cornerRadius(5)
            .scaleEffect(configuration.isPressed ? 0.99 : 1)
            .animation(.easeOut(duration: 0.1), value: configuration.isPressed)
    }
}
