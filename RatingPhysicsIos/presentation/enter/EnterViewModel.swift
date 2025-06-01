import Foundation

extension EnterScreen {
    @MainActor class EnterViewlModel : ObservableObject {
        @Published var password = ""
        @Published var isPasswordCorrect = true
        
        private(set) var fileURL: URL? = nil
        @Published private(set) var fileName: String? = nil
        @Published var isFileValid = true
        
        func setSavedData(password: UInt32, fileURL: URL) {
            self.password = String(password)
            self.fileURL = fileURL
            self.fileName = fileURL.lastPathComponent
        }
        
        func isPasswordCorrect(password: String) -> Bool {
            return password.count <= 5
            && password.allSatisfy({ symbol in symbol.isNumber })
        }
        
        func onFileSelected(newFileURL: URL) {
            fileURL = newFileURL
            fileName = newFileURL.lastPathComponent
            isFileValid = true
        }
        
        func validateData() -> Bool {
            var isPasswordCorrect = true
            
            if password.count < 3 || password.count > 5
                || !password.allSatisfy( { symbol in symbol.isNumber })
            {
                isPasswordCorrect = false
                self.isPasswordCorrect = false
            }
            
            if fileURL == nil {
                self.isFileValid = false
                return false
            }
            
            return isPasswordCorrect
        }
    }
}
