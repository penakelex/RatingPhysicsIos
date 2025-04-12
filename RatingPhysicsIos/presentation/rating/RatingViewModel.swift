import Foundation

extension RatingScreen {
    @MainActor class RatingViewModel : ObservableObject {
        @Published private(set) var data = DataState.loading
        private(set) var ratingData: RatingData!
        
        func load(useCases: RatingUseCases, password: UInt32, fileURL: URL, type: CipheredFileType) {
            Task {
                do {
                    ratingData = try await useCases.getRatingUseCase(password: password, fileURL: fileURL, type: type)
                    self.data = DataState.loadded
                } catch let error as GetRatingError {
                    switch error {
                    case .canNotAccessServer:
                        self.data = DataState.serverInaccessible
                    case .invalidPassword:
                        self.data = DataState.noStudentData
                    }
                }
            }
        }
    }
}
