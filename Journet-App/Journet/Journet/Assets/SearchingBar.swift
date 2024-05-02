import SwiftUI

//MARK: - Searching Bar
struct searchingBar: View {
    @Binding var text: String
    @State var editText: Bool = false
    
    var body: some View {
        HStack {
            TextField("#혼자만의_여유", text: self.$text)
                .padding()
                .padding(.horizontal, 15)
                .background(Color(.systemGray6))
                .cornerRadius(25)
                .font(.Hanbit15)
                .overlay(
                    HStack {
                        Spacer()
                        
                        if self.editText {
                            Button(action: {
                                self.editText = false
                                self.text = ""
                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(Color("MainColor"))
                                    .padding()
                            }
                        } else {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(Color("MainColor"))
                                .padding()
                        }
                    }
                ).onTapGesture {
                    self.editText = true
                }
        }
        .padding()
    }
}
