import SwiftUI

struct ErrorModifier: ViewModifier {
    let isError: Bool
    
    func body(content: Content) -> some View {
        if isError {
            content
                .foregroundColor(.red)
        } else {
            content
        }
    }
}

extension View {
    func errorStyle(_ isError: Bool) -> some View {
        self.modifier(ErrorModifier(isError: isError))
    }
}
