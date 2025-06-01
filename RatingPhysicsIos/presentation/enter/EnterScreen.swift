import SwiftUI
import Foundation

struct EnterScreen: View {
    @StateObject private var viewModel = EnterViewlModel()
    
    @State private var isDocumentPickerPresented = false
    @State private var isViewingRating = false
    
    let savedData: (UInt32, URL)?
    let onNextButtonClick: (UInt32, URL, CipheredFileType) -> ()
    
    var body: some View {
        VStack(alignment: .center) {
            TableDeveloperView()
                .padding(.bottom, 2)
        
            AppDeveloperContactView()
                .padding(.bottom, 12)

            PasswordInputView(
                password: $viewModel.password,
                isCorrect: $viewModel.isPasswordCorrect,
                isPasswordCorrect: { password in viewModel.isPasswordCorrect(password: password) }
            )

            FileSelectionView(
                fileName: viewModel.fileName,
                isValid: $viewModel.isFileValid
            ) { url in
                viewModel.onFileSelected(newFileURL: url)
            }
            .padding(.top, 20)

            Spacer()

            Button(action: {
                if viewModel.validateData() {
                    guard let fileType = CipheredFileType.fromString(viewModel.fileURL!.pathExtension) else {
                        return
                    }
                    
                    onNextButtonClick(UInt32(viewModel.password)!, viewModel.fileURL!, fileType)
                }
            }) {
                Text(String(localized: "next_button_label"))
                    .font(.title3)
            }
        }
        .padding(.horizontal)
        .onAppear {
            if let (password, fileURL) = savedData {
                viewModel.setSavedData(password: password, fileURL: fileURL)           }
        }
    }
}

struct EnterScreen_Previews: PreviewProvider {
    static var previews: some View {
        EnterScreen(savedData: nil) { _, _, _ in
        }
    }
}
