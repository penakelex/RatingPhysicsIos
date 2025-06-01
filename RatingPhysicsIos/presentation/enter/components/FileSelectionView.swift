import SwiftUI

struct FileSelectionView: View {
    let fileName: String?
    @Binding var isValid: Bool
    let onFileSelected: (URL) -> ()
    
    @State private var isDocumentPickerPresented = false
    
    var body: some View {
        VStack {
            Text(String(localized: "file_label") + (fileName == nil ? " \(String(localized: "file_extenstions_label"))" : " (\(fileName!))"))
                .font(.headline)
                .padding(.bottom, 4)
                .multilineTextAlignment(.center)
                .errorStyle(!isValid)
            
            Button(String(localized: "select_label")) {
                isDocumentPickerPresented = true
            }
            .sheet(isPresented: $isDocumentPickerPresented) {
                DocumentPicker { url in
                    isValid = true
                    onFileSelected(url)
                }
            }
        }
    }
}
