import SwiftUI

struct PasswordInputView: View {
    @Binding var password: String
    @Binding var isCorrect: Bool
    let isPasswordCorrect: (String) -> Bool
    
    var body: some View {
        VStack {
            Text(String(localized: "password_label"))
                .font(.headline)
                .errorStyle(!isCorrect)
            
            TextField(String(localized: "password_hint"), text: $password)
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)
                .cornerRadius(8)
                .onChange(of: password) { newPassword in
                    isCorrect = isPasswordCorrect(newPassword)
                }
        }
    }
}
